import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:window_manager/window_manager.dart';

class DesktopApp extends StatefulWidget {
  final String title;

  const DesktopApp({Key? key, required this.title}) : super(key: key);

  @override
  State<DesktopApp> createState() => _DesktopAppState();
}

class _DesktopAppState extends State<DesktopApp> with WindowListener {
  @override
  void initState() {
    super.initState();
    windowManager.addListener(this);

    _init();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  void onWindowEvent(String eventName) {
    // ignore: avoid_print
    print('[WindowManager] onWindowEvent: $eventName');
  }

  void _init() async {
    await windowManager.ensureInitialized();

    WindowOptions windowOptions = const WindowOptions(
      titleBarStyle: TitleBarStyle.normal,
      center: true,
      fullScreen: !kDebugMode,
    );

    windowManager.waitUntilReadyToShow(windowOptions, () async {
      // await windowManager.setClosable(kDebugMode);
      await windowManager.show();
      await windowManager.focus();

      // should be initialized before running the app, but the app won't load
      // if is run before :shrug:
      // fix needed
      // await ps();
    });
  }

  Future<void> ps() async {
    var process = await Process.start('powershell',
        ['-NoLogo', '-NonInteractive', '-ExecutionPolicy', 'Bypass']);
    stdout.addStream(process.stdout);
    stderr.addStream(process.stderr);

    String modulePath = normalize(join(dirname(Platform.resolvedExecutable),
        'powershell/modules/Gamebay.Shell'));

    process.stdin.writeln('Import-Module -Name $modulePath');
    process.stdin.writeln("Get-Module");

    // runInPs(process);
  }

  void runInPs(Process p) {
    p.stdin.writeln('Open-Settings mouse');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.title} desktop'),
      ),
      body: Container(
        color: Colors.grey[800],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                color: Colors.grey,
                child: const Center(child: Text('sidebar')),
              ),
            ),
            Expanded(
              flex: 10,
              child: Container(
                color: Colors.white,
                child: Center(
                  child: TextButton(
                    onPressed: () => throw Exception(),
                    child: const Text("Throw Test Exception"),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
