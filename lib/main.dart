import 'package:nyxx/nyxx.dart';
import 'package:swan/plugins/env/plugin.dart';
import 'package:swan/plugins/help/plugin.dart';
import 'package:swan/plugins/paste/plugin.dart';
import 'package:swan/plugins/skull/plugin.dart';
import 'package:swan/plugins/stackoverflow/plugin.dart';
import 'package:swan/plugins/swa/plugin.dart';

Future<void> main() async {
  Environment env = Environment.load();
  await Nyxx.connectGatewayWithOptions(
    GatewayApiOptions(
      token: env.discordToken,
      intents: GatewayIntents.allUnprivileged | GatewayIntents.messageContent,
    ),
    GatewayClientOptions(
      plugins: [
        Logging(),
        CliIntegration(),
        IgnoreExceptions(),
        EnvironmentPlugin(env),
        HelpPlugin(),
        DeleteByReaction(),
        CompileSwa(),
        StackOverflowMirror(),
        PasteFiles(),
      ],
    ),
  );
}
