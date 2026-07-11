import 'package:flutter/material.dart';
import 'package:fluttertest/data/notifiers.dart';
import 'package:fluttertest/views/pages/home_page.dart';
import 'package:fluttertest/views/pages/profile_page.dart';
import 'package:fluttertest/views/pages/settings_page.dart';
import 'package:fluttertest/views/widgets/navbar_widget.dart';

List<Widget> pages = [HomePage(), ProfilePage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Mapp'),
        centerTitle: true,
        actions: [
          ValueListenableBuilder(
            valueListenable: isDarkModeNotifer,
            builder: (BuildContext context, dynamic value, Widget? child) {
              return IconButton(
                onPressed: () {
                  isDarkModeNotifer.value = !isDarkModeNotifer.value;
                },
                icon: Icon(value ? Icons.light_mode : Icons.dark_mode),
              );
            },
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SettingsPage(title: 'Settings');
                  },
                ),
              );
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifer,
        builder: (BuildContext context, dynamic value, Widget? child) {
          return SingleChildScrollView(child: pages.elementAt(value));
        },
      ),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}
