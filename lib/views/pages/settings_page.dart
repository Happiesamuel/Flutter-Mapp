import 'package:flutter/material.dart';
import 'package:fluttertest/views/pages/expanded_flexible_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key, required this.title});
  final String title;
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController controller = TextEditingController();
  bool? isChecked = false;
  bool? isSwitched = false;
  double slideValue = 0.0;
  String? menuItem = 'e1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        // automaticallyImplyLeading: false,
        // leading: BackButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: .start,
            crossAxisAlignment: .start,
            spacing: 5,
            children: [
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(seconds: 5),
                      content: Text('Snackbar'),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },

                child: Text('Open Snakcbar'),
              ),
              Divider(color: Colors.teal, thickness: 5.0, endIndent: 200.0),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Alert Title'),
                        content: Text('Alert Content'),
                        actions: [
                          FilledButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Close'),
                          ),
                        ],
                      );
                    },
                  );
                },

                child: Text('Open Dialog'),
              ),
              DropdownButton(
                value: menuItem,
                items: [
                  DropdownMenuItem(value: 'e1', child: Text('Element 1')),
                  DropdownMenuItem(value: 'e2', child: Text('Element 2')),
                  DropdownMenuItem(value: 'e3', child: Text('Element 3')),
                ],
                onChanged: (String? value) {
                  setState(() {
                    menuItem = value;
                  });
                },
              ),
              TextField(
                controller: controller,
                decoration: InputDecoration(border: OutlineInputBorder()),
                onEditingComplete: () {
                  setState(() {
                    // controller.dispose()
                  });
                },
              ),
              Text(controller.text),
              Checkbox.adaptive(
                value: isChecked,
                tristate: true,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value;
                  });
                },
              ),
              CheckboxListTile.adaptive(
                value: isChecked,
                tristate: true,
                title: Text('Open Snackbar'),
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value;
                  });
                },
              ),
              Switch.adaptive(
                value: isSwitched!,
                onChanged: (bool? value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),
              SwitchListTile.adaptive(
                value: isSwitched!,
                title: Text('Switch me'),
                onChanged: (bool? value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),
              Slider.adaptive(
                value: slideValue,
                max: 10.0,
                divisions: 10,
                onChanged: (double value) {
                  setState(() {
                    slideValue = value;
                  });
                },
              ),
              Text('$slideValue'),
              InkWell(
                onTap: () {
                  print('click');
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  color: Colors.white12,
                ),
              ),
              Wrap(
                spacing: 5,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                    ),
                    child: Text('Click me'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ExpandedFlexiblePage();
                          },
                        ),
                      );
                    },
                    child: Text('Show Flexible and Expanded'),
                  ),
                  FilledButton(onPressed: () {}, child: Text('Click me')),
                  TextButton(onPressed: () {}, child: Text('Click me')),
                  OutlinedButton(onPressed: () {}, child: Text('Click me')),
                  CloseButton(),
                  BackButton(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
