import 'package:flutter/material.dart';
import 'package:flutterqwe/app_desktop.dart';
import 'package:upgrader/upgrader.dart';

import 'app_mobile.dart';
import 'util/platforms.dart';

class App extends StatelessWidget {
  final String title;
  final String version;

  const App({
    Key? key,
    required this.title,
    required this.version,
  }) : super(key: key);

  void appcast() async {
    const appcastURL = 'http://localhost:8080/client/appcast.xml';
    final cfg = AppcastConfiguration(
      url: appcastURL,
      supportedOS: ['windows'],
    );

    var upgrader = Upgrader(
      appcastConfig: cfg,
      debugLogging: true,
    );

    await upgrader.initialize();
    print(upgrader.isUpdateAvailable());
  }

  Widget _getApp() {
    if (kIsMobile) {
      return MobileApp(title: title);
    }

    appcast();

    return DesktopApp(
      title: title,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _getApp(),
    );
  }
}
