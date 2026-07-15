import 'package:flutter/material.dart';
import 'package:fluttertest/views/widgets/container_widget.dart';
import 'package:fluttertest/views/widgets/hero_widget.dart';
import 'package:fluttertest/views/pages/couse_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Arr {
  final String title;
  final String text;
  Arr({required this.title, required this.text});
}

final List<Arr> arr = [
  Arr(title: 'Basic Layout', text: 'This is a description'),
  Arr(title: 'Clean UI', text: 'This is a description'),
  Arr(title: 'Fix Bugs', text: 'This is a description'),
  Arr(title: 'Key Concepts', text: 'This is a description'),
  Arr(title: 'Widgets', text: 'This is a description'),
  Arr(title: 'Statefull & Stateless', text: 'This is a description'),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        spacing: 10,
        crossAxisAlignment: .start,
        children: [
          Column(
            crossAxisAlignment: .center,
            children: [
              SizedBox(
                height: 200,
                child: PageView.builder(
                  itemCount: arr.length,
                  scrollDirection: .horizontal,
                  controller: pageController,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: HeroWidget(
                        title: arr[index].title,
                        nextPage: CoursePage(),
                      ),
                    );
                  },
                ),
              ),
              SmoothPageIndicator(
                controller: pageController,
                count: arr.length,
                effect: WormEffect(
                  dotColor: Colors.grey.shade300,
                  activeDotColor: Colors.teal,
                  spacing: 3,
                  dotWidth: 6,
                  dotHeight: 6,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 100,
            child: ListView.separated(
              itemCount: 5,
              scrollDirection: .horizontal,
              separatorBuilder: (context, index) => SizedBox(width: 10),
              itemBuilder: (context, index) {
                return Container(
                  width: 200,
                  height: 100,
                  decoration: BoxDecoration(color: Colors.red),
                );
              },
            ),
          ),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              childAspectRatio: 0.8,
            ),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 6,
            itemBuilder: (context, index) {
              return SizedBox(
                width: 140,
                child: Column(
                  crossAxisAlignment: .start,
                  mainAxisSize: .min,
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/images/apple.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text('data'),
                  ],
                ),
              );
            },
          ),
          SizedBox(
            width: 140,
            child: Column(
              crossAxisAlignment: .start,
              mainAxisAlignment: .start,
              mainAxisSize: .min,
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/images/apple.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text('data'),
              ],
            ),
          ),
          Column(
            children: arr
                .map(
                  (a) => ContainerWidget(title: a.title, description: a.text),
                )
                .toList(),
          ),

          // ...List.generate(arr.length, (index) {
          //   return ContainerWidget(
          //     title: arr.elementAt(index).title,
          //     description: arr.elementAt(index).text,
          //   );
          // }),
          // Column(
          // children: List.generate(3, (index) {
          //   return ContainerWidget(
          //     title: 'Basic Layout',
          //     description: 'This is a description',
          //   );
          // }),
          // ),
        ],
      ),
    );
  }
}
