import 'package:flutter/material.dart';
import 'package:fluttertest/data/constants.dart';

class ContainerWidget extends StatefulWidget {
  const ContainerWidget({
    super.key,
    required this.title,
    required this.description,
  });
  final String title;
  final String description;
  @override
  State<ContainerWidget> createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends State<ContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: .start,
            crossAxisAlignment: .start,
            children: [
              Text(widget.title, style: KTextStyle.titleTealText),
              Text(widget.description, style: KTextStyle.descriptionText),
            ],
          ),
        ),
      ),
    );
  }
}
