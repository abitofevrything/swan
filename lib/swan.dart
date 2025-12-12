import 'dart:async';

import 'package:nyxx/nyxx.dart';
import 'package:swan/config.dart';
import 'package:swan/database/database.dart';
import 'package:swan/plugins/anti_spam.dart';
import 'package:swan/plugins/dartdoc/plugin.dart';
import 'package:swan/plugins/help.dart';
import 'package:swan/plugins/paste/plugin.dart';
import 'package:swan/plugins/reaction_delete.dart';
import 'package:swan/plugins/stackoverflow/plugin.dart';
import 'package:swan/plugins/swa/plugin.dart';
import 'package:swan/swan_plugin.dart';

class Swan {
  final SwanDatabase database = SwanDatabase();
  final Configuration configuration;

  late final List<SwanPlugin> plugins = [
    DartdocSearch(swan: this),
    if (configuration.pastebinKey case final key?)
      PasteFiles(swan: this, apiKey: key),
    StackOverflowMirror(swan: this, apiKey: configuration.stackExchangeKey),
    CompileSwa(swan: this),
    AntiSpam(swan: this),
    HelpPlugin(swan: this),
    ReactionDelete(swan: this),
  ];

  Swan({required this.configuration});

  factory Swan.fromEnvironment() =>
      Swan(configuration: Configuration.fromEnvironment());

  Future<void> run() async {
    final client = await Nyxx.connectGateway(
      configuration.discordToken,
      GatewayIntents.allUnprivileged |
          GatewayIntents.messageContent |
          GatewayIntents.guildMembers,
      options: GatewayClientOptions(
        plugins: [Logging(), CliIntegration(), IgnoreExceptions(), ...plugins],
      ),
    );

    await client.onEvent.drain();
    await database.close();
  }
}
