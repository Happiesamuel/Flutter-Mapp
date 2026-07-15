import 'package:flutter/material.dart';

class ExpandedFlexiblePage extends StatelessWidget {
  const ExpandedFlexiblePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Expanded Flexible')),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(child: Container(color: Colors.teal, height: 20)),
              Flexible(
                child: Container(
                  color: Colors.orange,
                  height: 20,
                  child: Text('Sam '),
                ),
              ),
            ],
          ),
          Divider(),
          Row(
            children: [
              Flexible(
                child: Container(
                  color: Colors.orange,
                  height: 20,
                  child: Text('Sam '),
                ),
              ),
              Expanded(child: Container(color: Colors.teal, height: 20)),
            ],
          ),
          Divider(),
          Expanded(child: Container(color: Colors.teal)),
          Divider(),
          Expanded(child: Container(color: Colors.orange)),
        ],
      ),
    );
  }
}
