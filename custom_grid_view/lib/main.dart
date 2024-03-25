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
          title: Text('Custom GridView Example'),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Item $index',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
