import 'package:flutter/material.dart';
import 'package:fluttertest/views/widget_tree.dart';
import 'package:fluttertest/views/widgets/hero_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});
  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  String confirmedEmail = '123@123';
  String confirmedPassword = '123';
  bool showPassword = true;
  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: LayoutBuilder(
          builder: (context, BoxConstraints constraints) {
            return FractionallySizedBox(
              widthFactor: widthScreen > 500 ? 0.5 : 1,
              // widthFactor: constraints.maxWidth > 500 ? 0.5 : 1,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    spacing: 20,
                    mainAxisAlignment: .center,
                    children: [
                      Center(child: HeroWidget(title: widget.title)),
                      Form(
                        key: formKey,
                        child: Column(
                          spacing: 20,
                          children: [
                            field(
                              controller: controllerEmail,
                              hintText: 'Enter your email',
                              labelText: 'Email',
                              onEditingComplete: () => setState(() {}),
                              icon: Icon(Icons.email),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Email is required';
                                }
                                if (!value.contains('@')) {
                                  return 'Enter a valid email';
                                }
                                return null;
                              },
                            ),
                            field(
                              controller: controllerPassword,
                              hintText: 'Enter your password',
                              labelText: 'Password',
                              onEditingComplete: () => setState(() {}),
                              icon: Icon(Icons.password),
                              handlePassword: () => setState(() {
                                showPassword = !showPassword;
                              }),
                              showPassword: showPassword,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password is required';
                                }
                                if (value.length < 3) {
                                  return 'Password must be at least 3 characters';
                                }
                                return null;
                              },
                            ),
                            FilledButton(
                              style: FilledButton.styleFrom(
                                minimumSize: Size(double.infinity, 40.0),
                              ),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  handleLoin();
                                }
                              },
                              child: Text(widget.title),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 50),

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
                    ],
                  ),
                ),
              ),
            );
          },
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
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 5),
          content: Text('Invalid credentials...email:123@123,password:123'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }
}

Widget field({
  required TextEditingController controller,
  required String hintText,
  required String labelText,
  required VoidCallback onEditingComplete,
  required Icon icon,
  required FormFieldValidator validator,
  GestureTapCallback? handlePassword,
  bool? showPassword,
}) {
  return TextFormField(
    controller: controller,
    obscureText:
        labelText == 'Password' && showPassword != null && showPassword && true,
    decoration: InputDecoration(
      hintText: hintText,
      labelText: labelText,
      prefixIcon: icon,
      suffixIcon: labelText == 'Password'
          ? GestureDetector(
              onTap: handlePassword,
              child: Icon(Icons.remove_red_eye),
            )
          : null,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    ),
    onEditingComplete: onEditingComplete,
    validator: validator,
    autovalidateMode: AutovalidateMode.onUserInteraction,
  );
}
