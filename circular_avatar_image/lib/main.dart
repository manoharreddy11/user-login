import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Circular Avatar Image Example'),
        ),
        body: Center(
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/profile_pic.jpg'),
            radius: 80,
          ),
        ),
      ),
    );
  }
}
