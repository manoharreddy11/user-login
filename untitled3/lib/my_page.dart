import 'package:flutter/material.dart';

class MyFirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Screen')),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        tooltip: 'Add to favourites',
        onPressed: () {
          print('FAB clicked!!');
        },
        child: Icon(Icons.favorite),
      ),
    );
  }
}
