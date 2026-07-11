import 'package:flutter/material.dart';
import 'package:fluttertest/data/constants.dart';
import 'package:fluttertest/data/notifiers.dart';
import 'package:fluttertest/views/pages/welcome_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

String title = 'Flutter Mapp';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    initThemeMode();
    super.initState();
  }

  void initThemeMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? isDarkmode = prefs.getBool(KConstants.themeKey);
    isDarkModeNotifer.value = isDarkmode ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkModeNotifer,
      builder: (BuildContext context, dynamic value, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.teal,
              brightness: value ? Brightness.dark : Brightness.light,
            ),
          ),
          home: WelcomePage(),
          // home: WidgetTree(),
        );
      },
    );
  }
}
