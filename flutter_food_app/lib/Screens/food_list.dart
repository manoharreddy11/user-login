import 'package:flutter/material.dart';
import 'package:flutter_food_app/screens/item_details.dart';

class FoodList extends StatelessWidget {
  final List<Map<String, dynamic>> foodItems = [
    {'name': 'Pizza', 'price': 10.99, 'image': 'assets/images/pizza.jpg'},
    {'name': 'Burger', 'price': 8.99, 'image': 'assets/images/hamburger.jpg'},
    {'name': 'Sandwich', 'price': 12.99, 'image': 'assets/images/pizza.jpg'},
    {'name': 'Pasta', 'price': 6.99, 'image': 'assets/images/hamburger.jpg'},
    {'name': 'Salad', 'price': 15.99, 'image': 'assets/images/pizza.jpg'},
    {
      'name': 'Frenchfries',
      'price': 23.99,
      'image': 'assets/images/hamburger.jpg'
    },
    {'name': 'KFC', 'price': 16.99, 'image': 'assets/images/pizza.jpg'},
    {
      'name': 'Pastries',
      'price': 45.99,
      'image': 'assets/images/hamburger.jpg'
    },
    {'name': 'Muffins', 'price': 40.99, 'image': 'assets/images/pizza.jpg'},
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: foodItems.length,
      itemBuilder: (context, index) {
        final item = foodItems[index];
        return ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          leading: Image.asset(
            item['image'],
            width: 100, // Adjust image width
            height: 100, // Adjust image height
            fit: BoxFit.cover,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item['name'],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                '\$${item['price'].toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          trailing: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemDetails(
                    item: item['name'],
                    price: item['price'],
                    imagePath: item['image'],
                  ),
                ),
              );
            },
            child: Text('Add to Cart'),
          ),
        );
      },
    );
  }
}
