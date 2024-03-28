import 'package:flutter/material.dart';
import 'signin.dart';
import 'registration.dart';
import 'homepage.dart';
import 'profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Demo',
      initialRoute: '/signin',
      routes: {
        '/signin': (context) => SignInPage(),
        '/registration': (context) => RegistrationPage(),
        '/home': (context) => HomePage(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}

// Your SignInPage, RegistrationPage, HomePage, and ProfilePage classes as defined in the previous code snippet
