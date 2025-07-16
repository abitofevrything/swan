import 'dart:async';

import 'package:nyxx/nyxx.dart';
import 'package:nyxx_extensions/nyxx_extensions.dart';
import 'package:swan/swan_plugin.dart';
import 'client.dart';
import 'post.dart';

class StackOverflowMirror extends SwanPlugin {
  final StackOverflowClient stackOverflowClient;

  @override
  String get name => 'StackOverflow';

  @override
  String? get helpText =>
      'Print a StackOverflow post by link.\n\n'
      '- Using the command `${swan.configuration.prefix}flow <link>`\n'
      '- Reply to a message containing a StackOverflow link with `${swan.configuration.prefix}flow`';

  StackOverflowMirror({required super.swan, required String? apiKey})
    : stackOverflowClient = StackOverflowClient(apiKey: apiKey);

  @override
  FutureOr<void> afterConnect(NyxxGateway client) {
    final links = RegExp(
      r'https:\/\/stackoverflow\.com\/'
      r'(questions\/\d+\/\S+'
      r'|'
      r'q\/\d+\/\S+)',
    );
    final regex = RegExp(
      r'^' +
          RegExp.escape(swan.configuration.prefix) +
          r'flow\s*' +
          r'(?<link>' +
          links.pattern +
          r')?',
    );

    client.onMessageCreate.listen((event) async {
      if (event.message.author case User(isBot: true)) return;

      final commandMatch = regex.firstMatch(event.message.content);
      if (commandMatch == null) return;

      var link = commandMatch.namedGroup('link');
      if (link == null) {
        final message = event.message.referencedMessage;
        if (message != null) {
          final linkMatch = links.firstMatch(message.content);
          link = linkMatch?.group(0);
        }
      }

      if (link == null) return;

      try {
        final uri = Uri.parse(link);
        final id = int.parse(uri.pathSegments[1]);

        try {
          final post = await stackOverflowClient.getPost(postId: id);
          await event.message.sendReply(
            MessageBuilder(
              allowedMentions: AllowedMentions(repliedUser: false),
              content: await postToDiscordMarkdown(post, swan.configuration),
            ),
          );
        } on StackOverflowClientException {
          await event.message.sendReply(
            MessageBuilder(
              allowedMentions: AllowedMentions(repliedUser: false),
              content: 'Failed to load post $id',
            ),
          );
        }
      } on FormatException {
        await event.message.sendReply(
          MessageBuilder(
            allowedMentions: AllowedMentions(repliedUser: false),
            content: 'Invalid link: $link',
          ),
        );
        return;
      }
    });
  }
}
