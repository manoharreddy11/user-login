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
          title: Text('Async Example: Chained Operations'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              performChainedOperations();
            },
            child: Text('Perform Chained Operations'),
          ),
        ),
      ),
    );
  }

  Future<void> performChainedOperations() async {
    print('Start operation...');
    final data1 = await operation1();
    final data2 = await operation2(data1);
    final result = await operation3(data2);
    print('Result: $result');
  }

  Future<String> operation1() async {
    await Future.delayed(Duration(seconds: 2));
    return 'Data 1';
  }

  Future<String> operation2(String input) async {
    await Future.delayed(Duration(seconds: 3));
    return '$input Data 2';
  }

  Future<String> operation3(String input) async {
    await Future.delayed(Duration(seconds: 1));
    return '$input Data 3';
  }
}
