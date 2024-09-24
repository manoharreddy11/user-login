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
          title: Text('Image Fade-in Animation Example'),
        ),
        body: Center(
          child: FadeInImage.assetNetwork(
            placeholder: 'assets/placeholder_image.png',
            image:
                'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}
