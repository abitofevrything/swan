import 'dart:async';
import 'dart:convert';
import 'package:nyxx/nyxx.dart';
import 'package:nyxx_extensions/nyxx_extensions.dart';
import 'package:swan/swan_plugin.dart';
import 'client.dart';

class PasteFiles extends SwanPlugin {
  final PastebinClient pastebinClient;

  @override
  String get name => 'PasteFiles';

  @override
  String? get helpText =>
      'Create PasteBin links for files.\n\n'
      '- Attach files to your message and send `${swan.configuration.prefix}paste`\n'
      '- Reply to a message with files attached with `${swan.configuration.prefix}paste`';

  static const int _maxFileSize = 2 * 1024 * 1024;

  PasteFiles({required super.swan, required String apiKey})
    : pastebinClient = PastebinClient(apiKey);

  @override
  FutureOr<void> afterConnect(NyxxGateway client) async {
    final regex = RegExp(
      r'^' + RegExp.escape(swan.configuration.prefix) + r'paste$',
    );

    client.onMessageCreate.listen((event) async {
      if (event.message.author case WebhookAuthor() || User(isBot: true)) {
        return;
      }

      if (!regex.hasMatch(event.message.content)) return;

      var attachments = event.message.attachments;
      if (attachments.isEmpty) {
        attachments = event.message.referencedMessage?.attachments ?? [];
      }

      if (attachments.isEmpty) {
        await event.message.sendReply(
          MessageBuilder(
            allowedMentions: AllowedMentions(repliedUser: false),
            content:
                'We didn\'t find any files attached to your message.\n\n'
                '$helpText',
          ),
        );
        return;
      }

      final files = <String, String>{};
      for (final attachment in attachments) {
        if (attachment.size > _maxFileSize) {
          await event.message.sendReply(
            MessageBuilder(
              allowedMentions: AllowedMentions(repliedUser: false),
              content:
                  'To balance server load, we limit the size of files to {$_maxFileSize}.\n'
                  '`${attachment.fileName}` is too large (${attachment.size} bytes).',
            ),
          );
          logger.warning(
            'File size too large: ${attachment.size} > 2MB: ${await event.message.url}',
          );
          return;
        }
        final bytes = await attachment.fetch();
        try {
          files[attachment.fileName] = utf8.decode(bytes);
        } on FormatException {
          await event.message.sendReply(
            MessageBuilder(
              allowedMentions: AllowedMentions(repliedUser: false),
              content:
                  'We only support text files. `${attachment.fileName}` is not a text file.',
            ),
          );
          return;
        }
      }

      final links = <String, String>{};
      for (final file in files.entries) {
        try {
          final id = await pastebinClient.upload(
            file.value,
            name: file.key,
            language: 'dart',
          );
          links[file.key] = id;
        } on PasteClientException catch (e) {
          await event.message.sendReply(
            MessageBuilder(
              allowedMentions: AllowedMentions(repliedUser: false),
              content: 'Failed to upload file to PasteBin: ${e.message}',
            ),
          );
          logger.severe('Failed to upload file to PasteBin: ${e.message}');
          return;
        }
      }

      final buffer = StringBuffer();
      if (links.length == 1) {
        buffer
          ..writeln('Your paste is ready:')
          ..writeln('<${links.entries.first.value}>');
      } else {
        buffer.writeln('Here are your files: ');
        for (final entry in links.entries) {
          buffer.writeln('- ${entry.key}: <${entry.value}>');
        }
      }
      await event.message.sendReply(
        MessageBuilder(
          allowedMentions: AllowedMentions(repliedUser: false),
          content: buffer.toString(),
        ),
      );

      logger.info('Uploaded ${links.length} files to PasteBin');
    });
  }
}
