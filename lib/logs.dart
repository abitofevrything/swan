import 'package:logging/logging.dart';

Future<void> logToFile(LogRecord event) async {
  /*
  final date = DateFormat('yyyy-MM-dd').format(DateTime.now());
  final timestamp = DateTime.now().toString();
  final logLevel = level.name.toUpperCase();

  final fileName = '$date.log';
  final logDir = Directory('logs');
  if (!logDir.existsSync()) {
    logDir.createSync();
  }
  final logFile = File('${logDir.path}/$fileName');
  final errorID = exception?.hashCode.toString();

  String logMessage = '[$timestamp] [$logLevel] [Logfile]';
  if (exception != null) {
    logMessage += ' [#$errorID]';
  }
  logMessage += ' $message';

  if (exception != null) {
    final stack = (stackTrace ?? StackTrace.current).toString().trim();
    final errorLog = 'Exception: $exception\nStack Trace: $stack';
    logMessage += '\n$errorLog';
  }

  print(logMessage);
  await logFile.writeAsString('$logMessage\n', mode: FileMode.append);
  */
}
