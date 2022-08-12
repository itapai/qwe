import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterqwe/file_logger.dart';
import 'package:loggy/loggy.dart';
import 'package:path/path.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'app.dart';

void main() async {
  // const exe =
  //     'C:\\Program Files (x86)\\Friendly Fire\\Gear Tuner\\Gear Tuner.exe';
  // const wd = null;

  // await Process.start(
  //   exe,
  //   [],
  //   workingDirectory: wd ?? dirname(exe),
  //   mode: ProcessStartMode.detached,
  // );

  // WidgetsFlutterBinding.ensureInitialized();

  // // await Firebase.initializeApp(
  // //   options: DefaultFirebaseOptions.currentPlatform,
  // // );
  // // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  // Loggy.initLoggy(
  //   logPrinter: FileOutput(),
  //   logOptions: const LogOptions(
  //     LogLevel.all,
  //     stackTraceLevel: LogLevel.error,
  //   ),
  // );

  runApp(const App(
    title: 'App',
    version: 'v0.0.0',
  ));
}
