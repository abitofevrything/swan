import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:dart_style/dart_style.dart';
import 'package:nyxx/nyxx.dart';
import 'package:nyxx_extensions/nyxx_extensions.dart';
import 'package:petitparser/petitparser.dart';
import 'package:swan/swan_plugin.dart';
import 'code.dart';
import 'grammar.dart';
import 'model.dart';

class CompileSwa extends SwanPlugin {
  @override
  String get name => 'CompileSwa';

  @override
  String? get helpText =>
      'Simple Widget Annotation\n\n'
      'To quickly build a Widget tree from SWA, type `${swan.configuration.prefix}swa` '
      'followed by your SWA code.\n\n'
      'Example:\n'
      '```swa\n'
      '${swan.configuration.prefix}swa Column > [ Center > Icon(Icons.help), Text(\'Hello, world!\') ]\n'
      '```';

  static const int _maxFileSize = 2 * 1024 * 1024;

  final Parser parser = SimpleWidgetAnnotationGrammer().build();

  CompileSwa({required super.swan});

  /// Builds the error message for when a parsing error occurs.
  String failureToMessage(String content, Failure failure) {
    var [line, char] = Token.lineAndColumnOf(failure.buffer, failure.position);
    line = max(0, line - 1);
    List<String> lines = content.split('\n');
    lines.insert(
      line,
      '${' '.padRight(char)}v [$line,$char]: ${failure.message}',
    );
    return lines.join('\n');
  }

  @override
  FutureOr<void> afterConnect(NyxxGateway client) {
    final regex = RegExp(
      r'^' +
          RegExp.escape(swan.configuration.prefix) +
          r'swa\s+(>?\s*(?<content>.+))?$',
    );

    final codeblockPattern = RegExp(
      r'(?<!\\)```swa\s+?(?<content>[\s\S]+?)(?<!\\)```',
    );

    client.onMessageCreate.listen((event) async {
      if (event.message.author case WebhookAuthor() || User(isBot: true)) {
        return;
      }

      final sources = <String>[];

      final commandMatch = regex.firstMatch(event.message.content);
      if (commandMatch != null) {
        sources.add(commandMatch.namedGroup('content')!);
      }

      final codeblockMatches = codeblockPattern
          .allMatches(event.message.content)
          .toList();
      for (final match in codeblockMatches) {
        sources.add(match.namedGroup('content')!);
      }

      for (final attachment in event.message.attachments) {
        if (!attachment.fileName.endsWith('.swa')) continue;
        if (attachment.size > _maxFileSize) {
          await event.message.sendReply(
            MessageBuilder(
              allowedMentions: AllowedMentions(repliedUser: false),
              content:
                  'To balance server load, we limit the size of files to {$_maxFileSize}.\n'
                  'File ${attachment.fileName} is too large (${attachment.size} bytes).',
            ),
          );
          logger.warning(
            'File size too large: ${attachment.size} > 2MB: ${await event.message.url}',
          );
          return;
        }
        final bytes = await attachment.fetch();
        try {
          sources.add(utf8.decode(bytes));
        } on FormatException {
          await event.message.sendReply(
            MessageBuilder(
              allowedMentions: AllowedMentions(repliedUser: false),
              content:
                  'We only support text files. File ${attachment.fileName} is not a text file.',
            ),
          );
          return;
        }
      }

      final uniqueSources = sources.toSet().toList();

      if (uniqueSources.length > 5) {
        await event.message.sendReply(
          MessageBuilder(
            allowedMentions: AllowedMentions(repliedUser: false),
            content:
                'To prevent spam, we limit the number of SWA sources per message to 5.\n'
                'Only the first 5 sources will be compiled.',
          ),
        );
      }

      for (final source in uniqueSources.take(5)) {
        await compile(event, source);
      }
    });
  }

  Future<void> compile(MessageCreateEvent event, String source) async {
    final link = await event.message.url;
    if (source.isEmpty) {
      await event.message.sendReply(
        MessageBuilder(
          allowedMentions: AllowedMentions(repliedUser: false),
          content: helpText,
        ),
      );
      logger.info('Sent SWA help message: $link');
      return;
    }

    Result result;
    try {
      result = parser.parse(source);
    } on Exception catch (e, stackTrace) {
      await event.message.sendReply(
        MessageBuilder(
          allowedMentions: AllowedMentions(repliedUser: false),
          content:
              'Something went wrong. Please contact and administrator. (#${e.hashCode})',
        ),
      );
      logger.severe(
        '[#${e.hashCode}] Unexpected error occured when parsing message: $link',
        e,
        stackTrace,
      );
      return;
    }

    if (result is Failure) {
      final output = failureToMessage(source, result);
      await event.message.sendReply(
        MessageBuilder(
          allowedMentions: AllowedMentions(repliedUser: false),
          content: 'Failed to parse your message. Error:\n```\n$output\n```',
        ),
      );
      logger.warning('Failed to parse message: $link');
    } else {
      logger.info('Successfully parsed message: $link');
      final annotation = (result.value as SimpleWidgetAnnotation).toCode();
      String output = annotation.toString();
      output = 'final output = $output;';
      output = DartFormatter(
        languageVersion: DartFormatter.latestLanguageVersion,
      ).format(output);
      output = output.replaceFirst('final output = ', '');

      if (output.length < 2000 - 12) {
        await event.message.sendReply(
          MessageBuilder(
            allowedMentions: AllowedMentions(repliedUser: false),
            content: '```dart\n$output\n```',
          ),
        );
      } else {
        await event.message.sendReply(
          MessageBuilder(
            allowedMentions: AllowedMentions(repliedUser: false),
            attachments: [
              AttachmentBuilder(
                fileName: 'output.dart',
                data: Uint8List.fromList(utf8.encode(output)),
              ),
            ],
          ),
        );
      }
    }
  }
}
