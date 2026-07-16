import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertest/data/notifiers.dart';
import 'package:fluttertest/views/pages/welcome_page.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ImagePicker _picker = ImagePicker();
  TextEditingController controller = TextEditingController();
  bool? isChecked = false;
  bool? isSwitched = false;
  double slideValue = 0.0;
  String? menuItem = 'e1';
  File? selectedImage;

  Future<void> pickImageFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() => selectedImage = File(image.path));
      }
    } catch (e) {
      debugPrint('Image picker error: $e');
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    }
  }

  Future<void> takePhoto() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      setState(() {
        selectedImage = File(photo.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: selectedImage != null
                ? FileImage(selectedImage!) as ImageProvider
                : const AssetImage('assets/images/apple.jpeg'),
          ),
          FilledButton(
            onPressed: () async => await pickImageFromGallery(),
            child: Text('Select an Image'),
          ),
          FilledButton(
            onPressed: () async => await takePhoto(),
            child: Text('Take Photo'),
          ),
          ListTile(
            onTap: () {
              selectedPageNotifer.value = 0;
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return WelcomePage();
                  },
                ),
              );
            },
            title: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
