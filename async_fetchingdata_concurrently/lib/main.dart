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
          title: Text('Async Example: Fetching Data Concurrently'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              fetchDataConcurrently();
            },
            child: Text('Fetch Data Concurrently'),
          ),
        ),
      ),
    );
  }

  Future<void> fetchDataConcurrently() async {
    print('Start fetching data...');
    final data1 = fetchFirstData();
    final data2 = fetchSecondData();
    print('Data 1: ${await data1}');
    print('Data 2: ${await data2}');
  }

  Future<String> fetchFirstData() async {
    await Future.delayed(Duration(seconds: 2));
    return 'First Data';
  }

  Future<String> fetchSecondData() async {
    await Future.delayed(Duration(seconds: 3));
    return 'Second Data';
  }
}
