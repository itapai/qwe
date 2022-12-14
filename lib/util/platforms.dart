import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;

bool get kIsAndroid => !kIsWeb && Platform.isAndroid;
bool get kIsIOS => !kIsWeb && Platform.isIOS;
bool get kIsMobile => kIsAndroid || kIsIOS;

bool get kIsLinux => !kIsWeb && Platform.isLinux;
bool get kIsMacOS => !kIsWeb && Platform.isMacOS;
bool get kIsWindows => !kIsWeb && Platform.isWindows;
bool get kIsDesktop => kIsLinux || kIsMacOS || kIsWindows;
