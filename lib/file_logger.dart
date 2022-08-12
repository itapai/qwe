import 'dart:convert';
import 'dart:io';

import 'package:loggy/loggy.dart';

class FileOutput extends LoggyPrinter {
  FileOutput()
      : file = File('logs/log.txt'),
        super() {
    file.create(recursive: true);

    _sink = file.openWrite(
      mode: FileMode.append,
      encoding: utf8,
    );
  }

  File file;
  IOSink? _sink;

  @override
  void onLog(LogRecord record) async {
    _sink?.writeln(record.toString());
    print(record);
  }
}
