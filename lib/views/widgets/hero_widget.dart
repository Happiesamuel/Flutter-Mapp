import 'package:flutter/material.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
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
    );
  }
}
