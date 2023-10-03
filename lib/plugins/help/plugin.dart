import 'package:nyxx/nyxx.dart';
import 'package:recase/recase.dart';
import 'package:swan/messages.dart';
import 'package:swan/plugins/base/plugin.dart';
import 'package:swan/plugins/env/plugin.dart';

class HelpPlugin extends BotPlugin {
  @override
  String get name => 'Help';

  @override
  String get helpText => 'Displays this message.';

  Logger logger = Logger('HelpPlugin');

  @override
  Future<void> afterConnect(NyxxGateway client) async {
    String commandPrefix = client.env.commandPrefix;
    client.updatePresence(
      PresenceBuilder(
        status: CurrentUserStatus.online,
        activities: [
          ActivityBuilder(
            name: 'Generating code | ${commandPrefix}help',
            type: ActivityType.game,
          ),
        ],
        isAfk: false,
      ),
    );
    List<BotPlugin> plugins =
        client.options.plugins.whereType<BotPlugin>().toList();
    client.onMessageCreate.listen((event) async {
      if (event.message.author case User(isBot: true)) return;
      if (RegExp(r'^' + RegExp.escape(commandPrefix) + r'help')
          .hasMatch(event.message.content)) {
        StringBuffer buffer = StringBuffer();
        buffer.writeln('## Help');
        for (final plugin in plugins) {
          String? helpText = plugin.buildHelpText(client);
          if (helpText == null) continue;
          buffer.writeln('### ${plugin.name.titleCase}');
          buffer.writeln(helpText);
        }
        await event.message.channel.sendMessage(
          MessageBuilder(
            // TODO: Handle messages that are too long.
            content: buffer.toString().split('').take(kMaxMessageLength).join(),
            replyId: event.message.id,
            allowedMentions: AllowedMentions(repliedUser: false),
          ),
        );
        logger.info('Sent help message:\n${event.link}');
      }
    });
  }
}
