import 'package:flutter/material.dart';

void main() {
  runApp(ProfilePage());
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('ProfilePage'),
            ),
            body: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 70.0,
                        backgroundImage: AssetImage('assets/profile.pic.jpg'),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        'Manohar Reddy',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        'Software Developer',
                        style: TextStyle(fontSize: 24.0, color: Colors.grey),
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.email),
                          SizedBox(width: 10.0),
                          Text('manohar246@gmail.com')
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.phone),
                          SizedBox(width: 10.0),
                          Text('9381962341')
                        ],
                      )
                    ]))));
  }
}
