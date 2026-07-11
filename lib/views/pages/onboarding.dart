import 'package:flutter/material.dart';
import 'package:fluttertest/data/constants.dart';
import 'package:fluttertest/views/pages/login_page.dart';
import 'package:lottie/lottie.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              spacing: 20,
              mainAxisAlignment: .center,
              children: [
                Center(child: Lottie.asset('assets/lotties/home.json')),
                Text(
                  'Flutter Mapp is the waay to learn flutter, period.',
                  style: KTextStyle.descriptionText,
                  textAlign: .center,
                ),
                FilledButton(
                  style: FilledButton.styleFrom(
                    minimumSize: Size(double.infinity, 40.0),
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginPage(title: 'Register');
                        },
                      ),
                      (route) => false,
                    );
                  },
                  child: Text('Register'),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
