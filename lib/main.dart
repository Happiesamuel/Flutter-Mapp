import 'package:flutter/material.dart';
import 'package:fluttertest/data/notifiers.dart';
import 'package:fluttertest/views/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

String title = 'Flutter Mapp';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
