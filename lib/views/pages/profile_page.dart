import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController controller = TextEditingController();
  bool? isChecked = false;
  bool? isSwitched = false;
  double slideValue = 0.0;
  String? menuItem = 'e1';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: .start,
          crossAxisAlignment: .start,
          spacing: 5,
          children: [
            DropdownButton(
              value: menuItem,
              items: [
                DropdownMenuItem(child: Text('Element 1'), value: 'e1'),
                DropdownMenuItem(child: Text('Element 2'), value: 'e2'),
                DropdownMenuItem(child: Text('Element 3'), value: 'e3'),
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
              title: Text('Click me'),
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
                  child: Text('Click me'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                  ),
                ),
                ElevatedButton(onPressed: () {}, child: Text('Click me')),
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
    );
  }
}
