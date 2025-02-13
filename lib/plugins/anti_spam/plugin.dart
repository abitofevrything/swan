import 'dart:collection';

import 'package:drift/drift.dart';
import 'package:nyxx/nyxx.dart';
import 'package:nyxx_extensions/nyxx_extensions.dart';
import 'package:swan/plugins/base/messages.dart';
import 'package:swan/plugins/base/plugin.dart';
import 'package:swan/plugins/database/database.dart';
import 'package:swan/plugins/database/plugin.dart';
import 'package:swan/plugins/env/plugin.dart';

class AntiSpam extends BotPlugin {
  static const cacheSize = 15;

  @override
  String get name => 'AntiSpam';

  @override
  String buildHelpText(NyxxGateway client) =>
      'Moderates spam by warning users for repeated messages.\n'
      'Repeating the same message 5 times additionally leads to a ban.\n\n'
      'To enable this plugin, set the appropriate channels: '
      '`${client.env.commandPrefix}warn-in #warnings #rules`';

  final Map<Snowflake, Map<Snowflake, Queue<Message>>> _messages = {};

  @override
  void afterConnect(NyxxGateway client) {
    super.afterConnect(client);

    client.onMessageCreate.listen((event) => _tryUpdateConfig(client, event));

    client.onGuildCreate.listen((event) async {
      if (event is! GuildCreateEvent) return;

      Future<Queue<Message>> fetchInitialCache(
        TextChannel channel,
      ) async {
        try {
          return Queue.of(
            (await channel.messages.fetchMany(limit: cacheSize)),
          );
        } on HttpResponseError {
          // Couldn't read messages, bot cannot see channel
          return Queue();
        }
      }

      _messages[event.guild.id] = {
        for (final channel in event.channels.whereType<TextChannel>())
          channel.id: await fetchInitialCache(channel),
      };

      logger.info('Populated message cache for ${event.guild.id}');
    });

    client.onMessageCreate.listen((event) async {
      if (event.message.author case WebhookAuthor() || User(isBot: true)) {
        return;
      }

      final guild = await event.guild?.get();
      final member = await event.member?.get();
      if (guild == null || member == null) return;

      final permissions = await member.computePermissionsIn(
        await event.message.channel.get() as GuildChannel,
      );

      if (permissions.isAdministrator) return;

      final checkedContent = await sanitizeContent(
        event.message.content,
        channel: event.message.channel,
        action: SanitizerAction.remove,
      );

      if (checkedContent.length < 20) return;

      final guildChannels = _messages[event.guild!.id] ??= {};
      int count = 0;
      for (final messages in guildChannels.values) {
        count += messages
            .where((element) =>
                element.author.id == event.message.author.id &&
                element.content == event.message.content)
            .length;
      }

      if (count != 0) {
        final config =
            await client.db.antiSpamConfig(event.guild!.id.value).first;

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
            await event.guild!.createBan(
              event.message.author.id,
              auditLogReason: 'Excessive spam',
              deleteMessages: const Duration(hours: 1),
            );

            logger.info('Banned ${event.message.author.id} ($count reposts)');
          } on HttpResponseError catch (e) {
            logger.warning(
                "Couldn't ban ${event.message.author.id} ($count reposts): ${e.message}");
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
    RegExp command = RegExp(
      r'^'
      '${client.env.commandPrefix}'
      r'warn-in\s+'
      r'<#(?<warnings>\d+)>\s+'
      r'<#(?<rules>\d+)>\s*'
      r'$',
    );

    RegExpMatch? match = command.firstMatch(event.message.content);

    if (match == null) return;

    final member = await event.member?.get();
    if (member == null) return;

    final channel = await event.message.channel.get();
    if (channel is! GuildChannel) return;

    final guild = await event.guild?.get();
    if (guild == null) return;

    final permissions = await channel.computePermissionsFor(member);
    if (!permissions.canManageGuild) return;

    try {
      Snowflake warningChannelId =
          Snowflake.parse(match.namedGroup('warnings')!);
      Snowflake rulesChannelId = Snowflake.parse(match.namedGroup('rules')!);

      client.db.setAntiSpamConfig(
        AntiSpamConfigsCompanion.insert(
          guildId: Value(guild.id.value),
          warningChannelId: warningChannelId.value,
          rulesChannelId: rulesChannelId.value,
        ),
      );

      await (channel as TextChannel).sendMessage(MessageBuilder(
        replyId: event.message.id,
        content:
            'Set warning channel to <#$warningChannelId> and rule channel to <#$rulesChannelId>',
      ));

      logger.info(
          'Updated config for ${guild.id}: warn in $warningChannelId, rules channel $rulesChannelId');
    } on FormatException {
      await (channel as TextChannel).sendMessage(MessageBuilder(
        replyId: event.message.id,
        content: "Couldn't parse channel IDs.",
      ));
      logger.warning('Failed to parse anti spam config from:\n${event.link}');
    }
  }
}
