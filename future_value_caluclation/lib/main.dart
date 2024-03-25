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
          title: Text('Future Example: Value Calculation'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              calculateValue().then((result) {
                print('Result: $result');
              });
            },
            child: Text('Calculate Value'),
          ),
        ),
      ),
    );
  }

  Future<int> calculateValue() {
    return Future<int>(() {
      int sum = 0;
      for (int i = 1; i <= 100; i++) {
        sum += i;
      }
      return sum;
    });
  }
}
