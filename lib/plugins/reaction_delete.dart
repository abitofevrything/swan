import 'package:nyxx/nyxx.dart';
import 'package:swan/swan_plugin.dart';

class ReactionDelete extends SwanPlugin {
  @override
  String get name => 'ReactionDelete';

  @override
  String get helpText => 'Delete bot messages by reacting to them with 💀.';

  ReactionDelete({required super.swan});

  @override
  Future<void> afterConnect(NyxxGateway client) async {
    client.onMessageReactionAdd.listen((event) async {
      if (event.emoji.name != '💀') return;

      final message = await event.message.get();
      if (message.author.id != client.user.id) return;

      final owner = (await message.reference?.message?.get())?.author.id;
      if (owner != event.userId) return;

      await message.delete();
      logger.info('Deleted message: ${message.id}');
    });
  }
}
