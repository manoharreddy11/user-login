import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  String _inputText = '';

  void _updateText(String newText) {
    setState(() {
      _inputText = newText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Input'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            onChanged: _updateText,
            decoration: InputDecoration(
              labelText: 'Type something...',
            ),
          ),
          SizedBox(height: 20),
          Text(
            'You typed: $_inputText',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TextInput(),
  ));
}
