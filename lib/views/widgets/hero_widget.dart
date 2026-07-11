import 'package:flutter/material.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: .center,
      children: [
        Hero(
          tag: 'hero1',
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(20),
            child: Image.asset(
              'assets/images/apple.jpeg',
              color: Colors.teal,
              colorBlendMode: BlendMode.darken,
              fit: BoxFit.cover,
            ),
          ),
        ),
        FittedBox(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 50.0,
              letterSpacing: 50.0,
              color: Colors.white30,
            ),
          ),
        ),
      ],
    );
  }
}
