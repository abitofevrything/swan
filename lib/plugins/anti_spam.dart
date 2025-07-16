import 'dart:collection';

import 'package:drift/drift.dart';
import 'package:nyxx/nyxx.dart';
import 'package:nyxx_extensions/nyxx_extensions.dart';
import 'package:swan/database/database.dart';
import 'package:swan/swan_plugin.dart';

class AntiSpam extends SwanPlugin {
  static const cacheSize = 15;

  @override
  String get name => 'AntiSpam';

  @override
  String get helpText =>
      'Moderates spam by warning users for repeated messages.\n'
      'Repeating the same message 5 times additionally leads to a ban.\n\n'
      'To enable this plugin, set the appropriate channels: '
      '`${swan.configuration.prefix}warn-in #warnings #rules`';

  final Map<Snowflake, Map<Snowflake, Queue<Message>>> _messages = {};

  AntiSpam({required super.swan});

  @override
  void afterConnect(NyxxGateway client) {
    client.onMessageCreate.listen((event) => _tryUpdateConfig(client, event));

    client.onGuildCreate.listen((event) async {
      if (event is! GuildCreateEvent) return;

      Future<Queue<Message>> fetchInitialCache(TextChannel channel) async {
        try {
          return Queue.of(
            await channel.messages
                .stream(order: StreamOrder.mostRecentFirst)
                .take(cacheSize)
                .toList(),
          );
        } on HttpResponseError {
          // Couldn't read messages, bot cannot see channel
          return Queue();
        }
      }

      _messages[event.guild.id] = Map.fromEntries(
        await event.channels
            .whereType<TextChannel>()
            .map(
              (channel) async =>
                  MapEntry(channel.id, await fetchInitialCache(channel)),
            )
            .wait,
      );

      logger.info('Populated message cache for ${event.guild.id}');
    });

    client.onMessageCreate.listen((event) async {
      if (event.message.author case WebhookAuthor() || User(isBot: true)) {
        return;
      }

      final guild = event.guild;
      if (guild == null) return;

      final permissions = await event.member!.computePermissionsIn(
        await event.message.channel.get() as GuildChannel,
      );
      if (permissions.isAdministrator) return;

      final checkedContent = await sanitizeContent(
        event.message.content,
        channel: event.message.channel,
        action: SanitizerAction.remove,
      );

      if (checkedContent.length < 20) return;

      final guildChannels = _messages[guild.id] ??= {};
      final count = guildChannels.values.fold(
        0,
        (count, queue) =>
            count +
            queue
                .where(
                  (message) =>
                      message.author.id == event.message.author.id &&
                      message.content == event.message.content,
                )
                .length,
      );

      if (count != 0) {
        final config = await swan.database.antiSpamConfig(guild.id.value);
        if (config == null) return;

        final warningChannel =
            (client.channels[Snowflake(config.warningChannelId)]
                as PartialTextChannel);

        await warningChannel.sendMessage(
          MessageBuilder(
            content:
                'Hey, <@${event.message.author.id}>, please take a second to '
                'read the <#${config.rulesChannelId}>,\nspecifically, the '
                'section about not duplicating your messages across channels.'
                '\nIf you want to move a message, copy it, delete it, **then** '
                'paste it in another channel.\n\nThanks!',
          ),
        );

        logger.info('Warned ${event.message.author.id} ($count reposts)');

        if (count > 4) {
          try {
            await guild.createBan(
              event.message.author.id,
              auditLogReason: 'Excessive spam',
              deleteMessages: const Duration(hours: 1),
            );

            logger.info('Banned ${event.message.author.id} ($count reposts)');
          } on HttpResponseError catch (e) {
            logger.warning(
              "Couldn't ban ${event.message.author.id} ($count reposts): ${e.message}",
            );
          }
        }
      }

      final messageQueue = guildChannels[event.message.channel.id] ??= Queue();

      messageQueue.addFirst(event.message);
      if (messageQueue.length > cacheSize) messageQueue.removeLast();
    });

    client.onMessageDelete.listen((event) async {
      _messages[event.guildId]?[event.channelId]?.removeWhere(
        (element) => element.id == event.id,
      );
    });
  }

  void _tryUpdateConfig(NyxxGateway client, MessageCreateEvent event) async {
    final command = RegExp(
      r'^'
      '${RegExp.escape(swan.configuration.prefix)}'
      r'warn-in\s+'
      r'<#(?<warnings>\d+)>\s+'
      r'<#(?<rules>\d+)>\s*'
      r'$',
    );

    final match = command.firstMatch(event.message.content);
    if (match == null) return;

    final guild = event.guild;
    if (guild == null) return;

    final permissions = await event.member!.computePermissionsIn(
      await event.message.channel.get() as GuildChannel,
    );
    if (!permissions.canManageGuild) return;

    try {
      final warningChannelId = Snowflake.parse(match.namedGroup('warnings')!);
      final rulesChannelId = Snowflake.parse(match.namedGroup('rules')!);

      await swan.database.setAntiSpamConfig(
        GuildConfigurationsCompanion.insert(
          guildId: Value(guild.id.value),
          warningChannelId: warningChannelId.value,
          rulesChannelId: rulesChannelId.value,
        ),
      );

      await event.message.sendReply(
        MessageBuilder(
          content:
              'Set warning channel to ${channelMention(warningChannelId)} and rule channel to ${channelMention(rulesChannelId)}',
        ),
      );

      logger.info(
        'Updated config for ${guild.id}: warn in $warningChannelId, rules channel $rulesChannelId',
      );
    } on FormatException {
      await event.message.sendReply(
        MessageBuilder(content: "Couldn't parse channel IDs."),
      );

      logger.warning(
        'Failed to parse anti spam config from ${await event.message.url}',
      );
    }
  }
}
