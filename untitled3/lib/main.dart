import 'package:flutter/material.dart';
import 'package:untitled3/my_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MyApp",
      home: new MyFirstPage(),
    );
  }
}
