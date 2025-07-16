import 'package:dotenv/dotenv.dart';

class Configuration {
  static const defaultPrefix = '.';

  final String prefix;
  final String discordToken;
  final String? stackExchangeKey;
  final String? pastebinKey;

  Configuration({
    required this.prefix,
    required this.discordToken,
    required this.stackExchangeKey,
    required this.pastebinKey,
  });

  factory Configuration.fromEnvironment() {
    final env = DotEnv(includePlatformEnvironment: true, quiet: true)..load();

    return Configuration(
      prefix: env['COMMAND_PREFIX'] ?? defaultPrefix,
      discordToken:
          env['DISCORD_BOT_TOKEN'] ??
          (throw StateError('Missing DISCORD_BOT_TOKEN environment variable')),
      stackExchangeKey: env['STACKEXCHANGE_API_KEY'],
      pastebinKey: env['PASTEBIN_API_KEY'],
    );
  }
}
