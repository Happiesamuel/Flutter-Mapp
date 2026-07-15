import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:fluttertest/data/classes/activity_class.dart';
import 'package:fluttertest/views/widgets/hero_widget.dart';
import 'package:http/http.dart' as http;

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  Future<Activity>? activity;
  bool isFirst = true;
  @override
  void initState() {
    fecthRandomActivity();
    super.initState();
  }

  void fecthRandomActivity() {
    setState(() {
      activity = fetchActivity();
    });
  }

  Future<Activity> fetchActivity() async {
    var url = Uri.https('bored-api.appbrewery.com', '/random');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return Activity.fromJson(
        convert.jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isFirst = !isFirst;
              });
            },
            icon: Icon(Icons.switch_access_shortcut),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: AnimatedCrossFade(
              firstChild: Column(
                spacing: 5,
                children: [
                  HeroWidget(title: 'Course'),
                  FutureBuilder(
                    future: activity,
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasData) {
                        Activity activity = snapshot.data;
                        return Text(activity.activity);
                      } else {
                        return Text('Error');
                      }
                    },
                  ),
                  FilledButton(
                    onPressed: fecthRandomActivity,
                    child: Text('Fetch new activity'),
                  ),
                ],
              ),
              secondChild: Center(
                child: Image.asset('assets/images/apple.jpeg'),
              ),
              crossFadeState: isFirst
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: Duration(milliseconds: 1000),
            ),
          ),
        ),
      ),
    );
  }
}

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: FutureBuilder(
//         future: getData(),
//         builder: (context, AsyncSnapshot snapshot) {
//           Widget widget;
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             widget = CircularProgressIndicator();
//           }
//           if (snapshot.hasData) {
//             Activity activity = snapshot.data;
//             widget = SingleChildScrollView(
//               child: Center(
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 20.0),
//                   child: Column(
//                     children: [
//                       HeroWidget(title: 'Course'),
//                       Text(activity.activity),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           } else {
//             widget = Center(child: Text('Error'));
//           }
//           return widget;
//         },
//       ),
//     );
//   }
// }
