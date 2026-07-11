import 'package:flutter/material.dart';
import 'package:fluttertest/views/pages/login_page.dart';
import 'package:fluttertest/views/pages/onboarding.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: .center,
              spacing: 20,
              children: [
                Lottie.asset('assets/lotties/welcome.json', height: 400),
                FittedBox(
                  child: Text(
                    'Flutter Mapp',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      letterSpacing: 50.0,
                    ),
                  ),
                ),
                FilledButton(
                  style: FilledButton.styleFrom(
                    minimumSize: Size(double.infinity, 40.0),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Onboarding();
                        },
                      ),
                    );
                  },
                  child: Text('Get Started'),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: Size(double.infinity, 40.0),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginPage(title: 'Login');
                        },
                      ),
                    );
                  },
                  child: Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
