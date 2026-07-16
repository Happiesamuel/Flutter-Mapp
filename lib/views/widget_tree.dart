import 'package:flutter/material.dart';
import 'package:fluttertest/data/constants.dart';
import 'package:fluttertest/data/notifiers.dart';
import 'package:fluttertest/views/pages/home_page.dart';
import 'package:fluttertest/views/pages/profile_page.dart';
import 'package:fluttertest/views/pages/settings_page.dart';
import 'package:fluttertest/views/widgets/navbar_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<Widget> pages = [HomePage(), ProfilePage()];

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Mapp'),
        centerTitle: false,
        actions: [
          ValueListenableBuilder(
            valueListenable: isDarkModeNotifer,
            builder: (BuildContext context, dynamic value, Widget? child) {
              return IconButton(
                onPressed: () async {
                  isDarkModeNotifer.value = !isDarkModeNotifer.value;
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setBool(
                    KConstants.themeKey,
                    isDarkModeNotifer.value,
                  );
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
// import 'package:flutter/material.dart';
// import 'package:fluttertest/data/constants.dart';
// import 'package:fluttertest/data/notifiers.dart';
// import 'package:fluttertest/views/pages/home_page.dart';
// import 'package:fluttertest/views/pages/profile_page.dart';
// import 'package:fluttertest/views/pages/settings_page.dart';
// import 'package:fluttertest/views/widgets/navbar_widget.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:swipeable_page_route/swipeable_page_route.dart';

// List<Widget> pages = [HomePage(), ProfilePage()];

// class WidgetTree extends StatefulWidget {
//   const WidgetTree({super.key});

//   @override
//   State<WidgetTree> createState() => _WidgetTreeState();
// }

// class _WidgetTreeState extends State<WidgetTree> {
//   final PageController _pageController = PageController();
//   @override
//   void initState() {
//     super.initState();

//     selectedPageNotifer.addListener(_onNotifierChanged);
//   }

//   void _onNotifierChanged() {
//     _pageController.animateToPage(
//       selectedPageNotifer.value,
//       duration: const Duration(milliseconds: 300),
//       curve: Curves.easeInOut,
//     );
//   }

//   @override
//   void dispose() {
//     selectedPageNotifer.removeListener(_onNotifierChanged);
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter Mapp'),
//         centerTitle: false,
//         actions: [
//           ValueListenableBuilder(
//             valueListenable: isDarkModeNotifer,
//             builder: (BuildContext context, dynamic value, Widget? child) {
//               return IconButton(
//                 onPressed: () async {
//                   isDarkModeNotifer.value = !isDarkModeNotifer.value;
//                   final SharedPreferences prefs =
//                       await SharedPreferences.getInstance();
//                   await prefs.setBool(
//                     KConstants.themeKey,
//                     isDarkModeNotifer.value,
//                   );
//                 },
//                 icon: Icon(value ? Icons.light_mode : Icons.dark_mode),
//               );
//             },
//           ),
//           IconButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 SwipeablePageRoute(
//                   builder: (context) {
//                     return SettingsPage(title: 'Settings');
//                   },
//                 ),
//               );
//             },
//             icon: Icon(Icons.settings),
//           ),
//         ],
//       ),
//       body: PageView(
//         controller: _pageController,
//         onPageChanged: (index) {
//           // When user swipes, update the notifier so the nav bar highlight follows
//           selectedPageNotifer.value = index;
//         },
//         children: pages,
//       ),
//       bottomNavigationBar: NavbarWidget(),
//     );
//   }
// }
