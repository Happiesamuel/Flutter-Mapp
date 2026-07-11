import 'package:flutter/material.dart';
import 'package:fluttertest/views/widget_tree.dart';
import 'package:fluttertest/views/widgets/hero_widget.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});
  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerEmail = TextEditingController(text: '123');
  TextEditingController controllerPassword = TextEditingController(text: '456');
  String confirmedEmail = '123';
  String confirmedPassword = '456';

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

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
                Center(child: HeroWidget(title: widget.title)),
                TextField(
                  controller: controllerEmail,
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onEditingComplete: () {
                    setState(() {
                      // controller.dispose()
                    });
                  },
                ),
                TextField(
                  controller: controllerPassword,
                  // keyboardType: keyb,
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.password),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onEditingComplete: () {
                    setState(() {
                      // controller.dispose()
                    });
                  },
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     showModalBottomSheet(
                //       context: context,
                //       isScrollControlled:
                //           true, // required to let it use custom sizing like DraggableScrollableSheet
                //       builder: (context) => DraggableScrollableSheet(
                //         expand: false, // important inside showModalBottomSheet
                //         initialChildSize: 0.3,
                //         minChildSize: 0.1,
                //         maxChildSize: 0.9,
                //         builder: (context, scrollController) {
                //           return Container(
                //             decoration: BoxDecoration(
                //               color: Colors.teal,
                //               borderRadius: BorderRadius.vertical(
                //                 top: Radius.circular(20),
                //               ),
                //             ),
                //             child: ListView.builder(
                //               controller: scrollController,
                //               itemCount: 30,
                //               itemBuilder: (context, index) =>
                //                   ListTile(title: Text('Item $index')),
                //             ),
                //           );
                //         },
                //       ),
                //     );
                //   },
                //   child: Text('Show Sheet'),
                // ),
                FilledButton(
                  style: FilledButton.styleFrom(
                    minimumSize: Size(double.infinity, 40.0),
                  ),
                  onPressed: () {
                    handleLoin();
                  },
                  child: Text(widget.title),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void handleLoin() {
    final (emailText, passwordText) = (
      controllerEmail.text,
      controllerPassword.text,
    );
    if (emailText == confirmedEmail && passwordText == confirmedPassword) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) {
            return WidgetTree();
          },
        ),
        (route) => false,
      );
    }
  }
}
