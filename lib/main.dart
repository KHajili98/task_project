
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'data/core/injection.dart';
import 'presentation/app.dart';

void main() {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(App());
}
