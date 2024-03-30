import 'package:flutter/material.dart';
import 'package:flutter_food_app/screens/food_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food App'),
      ),
      body: FoodList(),
    );
  }
}
