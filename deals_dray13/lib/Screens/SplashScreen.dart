import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Simulating a 2-second delay to mimic loading and then navigate to the login screen
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(
          context, '/login'); // Navigate to Login Screen
    });

    return Scaffold(
      backgroundColor: Colors.blueGrey, // Background color
      body: Center(
        child: Text(
          'Deals Dray',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
