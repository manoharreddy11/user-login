import 'package:flutter/material.dart';
import 'package:flutter_food_app/screens/item_details.dart';

class FoodList extends StatelessWidget {
  final List<Map<String, dynamic>> foodItems = [
    {
      'name': 'Pizza',
      'price': 10.99,
      'image': 'assets/images/pizza.jpg',
      'restaurant': {'name': 'Pizza Palace', 'address': '123 Main St, Hyd'}
    },
    {
      'name': 'Burger',
      'price': 8.99,
      'image': 'assets/images/hamburger.jpg',
      'restaurant': {'name': 'Dominos', 'address': 'Jntu Main St, Hyd'}
    },
    {
      'name': 'Sandwich',
      'price': 12.99,
      'image': 'assets/images/pizza.jpg',
      'restaurant': {
        'name': 'Mc Donald s',
        'address': '201,Miyapur Main St, Hyd'
      }
    },
    {
      'name': 'Pasta',
      'price': 6.99,
      'image': 'assets/images/hamburger.jpg',
      'restaurant': {
        'name': 'La Pinoz Pizza',
        'address': 'Gachibowli main st, Hyd'
      }
    },
    {
      'name': 'Salad',
      'price': 15.99,
      'image': 'assets/images/pizza.jpg',
      'restaurant': {'name': 'Subway', 'address': 'Dilsukhnagar Main St, Hyd'}
    },
    {
      'name': 'Sicilian',
      'price': 15.99,
      'image': 'assets/images/hamburger.jpg',
      'restaurant': {'name': 'Pista House', 'address': 'Kondapur Main St, Hyd'}
    },
    {
      'name': 'Pepperoni',
      'price': 15.99,
      'image': 'assets/images/pizza.jpg',
      'restaurant': {'name': 'Mehfil', 'address': 'Nizampet Main St, Hyd'}
    },
    {
      'name': 'Frenchfries',
      'price': 23.99,
      'image': 'assets/images/hamburger.jpg',
      'restaurant': {'name': 'KS Bakers', 'address': 'Kukatpally Main St, Hyd'}
    },
    {
      'name': 'KFC',
      'price': 16.99,
      'image': 'assets/images/pizza.jpg',
      'restaurant': {'name': 'Pizza Hut', 'address': 'Moosapet Main St, Hyd'}
    },
    {
      'name': 'Pastries',
      'price': 45.99,
      'image': 'assets/images/hamburger.jpg',
      'restaurant': {'name': 'Tipsy Topsy', 'address': 'Ameerpet Main St, Hyd'}
    },
    {
      'name': 'Muffins',
      'price': 40.99,
      'image': 'assets/images/pizza.jpg',
      'restaurant': {
        'name': 'Nosh Bistro',
        'address': 'Hitec City Main St, Hyd'
      }
    },
    // Your list of food items
    // ...
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[100], // Background color for the list
      child: ListView.builder(
        itemCount: foodItems.length,
        itemBuilder: (context, index) {
          final item = foodItems[index];
          final String itemName = item['name'];
          final double itemPrice = item['price'];
          final String itemImage = item['image'];
          final String restaurantName = item['restaurant']['name'];
          final String restaurantAddress = item['restaurant']['address'];

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            child: Row(
              children: [
                Container(
                  width: 160, // Width of the image container
                  height: 200, // Increased height for the image
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(itemImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 16), // Space between image and item details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        itemName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '\$${itemPrice.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Restaurant: $restaurantName',
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        'Address: $restaurantAddress',
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Itemdetails(
                                item: itemName,
                                price: itemPrice,
                                imagePath: itemImage,
                                restaurantName: restaurantName,
                                restaurantAddress: restaurantAddress,
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 12),
                        ),
                        child: Text(
                          'Add to Cart',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
