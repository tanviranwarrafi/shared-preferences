import 'package:flutter/material.dart';
import 'package:tutorial/tutorial_app.dart';
import 'package:tutorial/utils/app_utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await portraitMode();
  runApp(TutorialApp());
}
