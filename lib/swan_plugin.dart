import 'package:nyxx/nyxx.dart';
import 'package:swan/swan.dart';

abstract class SwanPlugin extends NyxxPlugin<NyxxGateway> {
  final Swan swan;

  String? get helpText;

  SwanPlugin({required this.swan});
}
