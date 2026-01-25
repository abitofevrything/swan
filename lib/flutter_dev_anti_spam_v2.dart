import 'dart:async';

import 'package:nyxx/nyxx.dart';
import 'package:nyxx_extensions/nyxx_extensions.dart';

class FlutterDevAntiSpamV2 extends NyxxPlugin<NyxxGateway> {
  @override
  FlutterDevAntiSpamV2State createState() => FlutterDevAntiSpamV2State(this);
}

class FlutterDevAntiSpamV2State
    extends NyxxPluginState<NyxxGateway, FlutterDevAntiSpamV2> {
  Map<Snowflake, Map<Snowflake, Set<Message>>> previousUserChannels = {};
  Map<Snowflake, Map<Snowflake, Set<Message>>> currentUserChannels = {};

  late final Timer rotateTimer;

  FlutterDevAntiSpamV2State(super.plugin);

  @override
  void afterConnect(NyxxGateway client) {
    super.afterConnect(client);

    rotateTimer = Timer.periodic(Duration(seconds: 60), (_) {
      previousUserChannels = currentUserChannels;
      currentUserChannels = {};
    });

    final mutedChannel =
        client.channels[Snowflake(1223112357366988831)] as PartialTextChannel;

    client.onMessageCreate.listen((event) async {
      // Ensure we are on FlutterDev.
      if (event.guild?.id != Snowflake(420324994703163402) ||
          event.member == null) {
        return;
      }

      final message = event.message;

      final looksLikeSpam =
          message.attachments.isNotEmpty ||
          message.content.contains('discord.com') ||
          message.content.contains('discordapp.com');

      if (!looksLikeSpam) {
        return;
      }

      final map = previousUserChannels.containsKey(message.author.id)
          ? previousUserChannels
          : currentUserChannels;

      final channels = map.putIfAbsent(message.author.id, () => {});
      (channels[message.channel.id] ??= {}).add(event.message);

      logger.info(
        'User ${message.author.id} sent spam-like messages in ${channels.length} channels.',
      );

      if (channels.length >= 3) {
        try {
          // Add muted role.
          await event.member!.addRole(Snowflake(1049630968216039434));

          // Send warning.
          await mutedChannel.sendMessage(
            MessageBuilder(
              content:
                  '${userMention(message.author.id)} you have been muted as we have detected spam from your account. Please mention a moderator to review your case.',
            ),
          );

          // Delete offending messages.
          for (final channel in channels.values) {
            for (final message in channel) {
              await message.delete();
            }
          }
        } on HttpResponseError catch (e) {
          logger.warning(
            'Unable to mute ${message.author.id}: ${e.message} (${e.errorCode})',
          );
          // Discard failure, it's probably a permissions issue.
        }
      }
    });
  }

  @override
  void beforeClose(NyxxGateway client) {
    super.beforeClose(client);

    rotateTimer.cancel();
  }
}
