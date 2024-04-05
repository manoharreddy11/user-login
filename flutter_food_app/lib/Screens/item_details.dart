import 'package:flutter/material.dart';
import 'package:flutter_food_app/Screens/cart_page.dart';

class Itemdetails extends StatelessWidget {
  final String item;
  final double price;
  final String imagePath;

  const Itemdetails({
    Key? key,
    required this.item,
    required this.price,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              item,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '\$${price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => cartPage()),
                ); // Navigate back to previous screen
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
