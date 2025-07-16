import 'package:nyxx/nyxx.dart';
import 'package:nyxx_extensions/nyxx_extensions.dart';
import 'package:recase/recase.dart';
import 'package:swan/swan_plugin.dart';

class HelpPlugin extends SwanPlugin {
  @override
  String get name => 'Help';

  @override
  String? get helpText => null;

  HelpPlugin({required super.swan});

  @override
  Future<void> afterConnect(NyxxGateway client) async {
    client.updatePresence(
      PresenceBuilder(
        status: CurrentUserStatus.online,
        activities: [
          ActivityBuilder(
            name: 'Generating code | ${swan.configuration.prefix}help',
            type: ActivityType.game,
          ),
        ],
        isAfk: false,
      ),
    );

    final regex = RegExp(
      r'^' + RegExp.escape(swan.configuration.prefix) + r'help',
    );

    client.onMessageCreate.listen((event) async {
      if (event.message.author case WebhookAuthor() || User(isBot: true)) {
        return;
      }

      if (!regex.hasMatch(event.message.content)) return;

      final buffer = StringBuffer()..writeln('## Help');

      for (final plugin in swan.plugins) {
        final helpText = plugin.helpText;
        if (helpText == null) continue;

        buffer
          ..writeln('### ${plugin.name.titleCase}')
          ..writeln(helpText);
      }

      await event.message.sendReply(
        MessageBuilder(
          // TODO: Handle messages that are too long.
          content: buffer.toString().split('').take(2000).join(),
          allowedMentions: AllowedMentions(repliedUser: false),
        ),
      );
      logger.info('Sent help message: ${await event.message.url}');
    });
  }
}
