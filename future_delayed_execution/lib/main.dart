import 'dart:async';
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
          title: Text('Future Example: Delayed Execution'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              executeAfterDelay();
            },
            child: Text('Execute after delay'),
          ),
        ),
      ),
    );
  }

  Future<void> executeAfterDelay() {
    print('Start executing...');
    return Future.delayed(Duration(seconds: 2), () {
      print('Execution after delay.');
    });
  }
}
