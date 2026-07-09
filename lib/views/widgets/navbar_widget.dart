import 'package:flutter/material.dart';
import 'package:fluttertest/data/notifiers.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifer,
      builder: (BuildContext context, dynamic value, Widget? child) {
        return NavigationBar(
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
          ],
          onDestinationSelected: (int value) {
            selectedPageNotifer.value = value;
            // setState(() {
            //   selectedPage = value;
            // });
          },
          selectedIndex: value,
        );
      },
    );
  }
}
