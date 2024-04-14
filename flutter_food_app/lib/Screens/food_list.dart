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
    }, // Your food items data here...
  ];

  final List<Map<String, dynamic>> recommendedItems = [
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
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        slivers: [
          // Recommended items
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Recommended Products',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 160,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: recommendedItems.length,
                itemBuilder: (context, index) {
                  final item = recommendedItems[index];
                  final String itemName = item['name'];
                  final double itemPrice = item['price'];
                  final String itemImage = item['image'];

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(itemImage),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          itemName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '\$${itemPrice.toStringAsFixed(2)}',
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          // Divider between recommended items and food list
          SliverToBoxAdapter(
            child: Divider(
              thickness: 1,
              color: Colors.grey[100],
            ),
          ),
          // Food list
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final item = foodItems[index];
                final String itemName = item['name'];
                final double itemPrice = item['price'];
                final String itemImage = item['image'];
                final String restaurantName = item['restaurant']['name'];
                final String restaurantAddress = item['restaurant']['address'];

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6.0,
                    horizontal: 6.0,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 160,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(itemImage),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
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
                            SizedBox(height: 8),
                            SizedBox(height: 50), // Added space here
                            GestureDetector(
                              onTap: () {
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
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: 4,
                                  horizontal: 20,
                                ),
                                child: Text(
                                  'Add to Cart',
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              childCount: foodItems.length,
            ),
          ),
        ],
      ),
    );
  }
}
