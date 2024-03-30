import 'package:flutter/material.dart';
import 'package:flutter_food_app/screens/splashscreen.dart';
import 'package:flutter_food_app/screens/home_screen.dart';
import 'package:flutter_food_app/screens/food_list.dart';
//import 'package:flutter_food_app/screens/item_details.dart';
import 'package:flutter_food_app/screens/cart_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Food App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => HomeScreen(),
        '/foodList': (context) => FoodList(),
        //'/itemDetails': (context) => ItemDetails(),
        '/cart': (context) => CartPage(),
      },
    );
  }
}
