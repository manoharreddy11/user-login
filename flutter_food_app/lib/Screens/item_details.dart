import 'package:flutter/material.dart';
import 'package:flutter_food_app/screens/UserProfileScreen.dart'; // Importing UserProfileScreen

class Itemdetails extends StatefulWidget {
  final String item;
  final double price;
  final String imagePath;
  final String restaurantName;
  final String restaurantAddress;

  const Itemdetails({
    Key? key,
    required this.item,
    required this.price,
    required this.imagePath,
    required this.restaurantName,
    required this.restaurantAddress,
  }) : super(key: key);

  @override
  _ItemdetailsState createState() => _ItemdetailsState();
}

class _ItemdetailsState extends State<Itemdetails> {
  int itemCount = 0;

  final List<Map<String, dynamic>> otherRecommendedItems = [
    {
      'name': 'Biryani',
      'price': 12.99,
      'imagePath': 'assets/images/hamburger.jpg',
      'restaurant': {'name': 'Paradise', 'address': '123 Main St, Hyd'}
    },
    {
      'name': 'Chinese Rice',
      'price': 8.99,
      'imagePath': 'assets/images/pizza.jpg',
      'restaurant': {'name': 'Chopsticks', 'address': 'Jntu Main St, Hyd'}
    },
    {
      'name': 'Ice Cream',
      'price': 6.49,
      'imagePath': 'assets/images/hamburger.jpg',
      'restaurant': {
        'name': 'Cold Stone',
        'address': '201,Miyapur Main St, Hyd'
      }
    },
    {
      'name': 'Sushi',
      'price': 15.99,
      'imagePath': 'assets/images/pizza.jpg',
      'restaurant': {'name': 'Sushi Express', 'address': 'ABC Street, Hyd'}
    },
    {
      'name': 'Steak',
      'price': 25.99,
      'imagePath': 'assets/images/hamburger.jpg',
      'restaurant': {'name': 'Grill House', 'address': 'XYZ Road, Hyd'}
    },
    {
      'name': 'Pasta',
      'price': 16.99,
      'imagePath': 'assets/images/pizza.jpg',
      'restaurant': {'name': 'Pasta Paradise', 'address': 'PQR Lane, Hyd'}
    },
    {
      'name': 'Sushi Roll',
      'price': 18.99,
      'imagePath': 'assets/images/hamburger.jpg',
      'restaurant': {'name': 'Sushi Masters', 'address': 'EFG Avenue, Hyd'}
    },
    // Other recommended items
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Details'),
        backgroundColor: Colors.green[600],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                  child: Image.asset(
                    widget.imagePath,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.item,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '\$${widget.price.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Item Description:', // Updated text
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Incredibly authentic and delightfully delicious, this Greek indulgence boasts of tangy critic flavour that?s unparalleled amongst other feta?s. Add chunks to a salad or crumble over pizza for a tasty treat',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '\u{23F0} Estimated delivery in 2-3 days delivery charge will apply', // Clock icon added
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(Icons.star), // Star icon added
                        Text(
                          'Delivery charge will apply',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(Icons
                            .check_circle_outline), // Double tick icon added
                        Text(
                          'Direct delivery by Hand Toss', // Updated text
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    itemCount > 0
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  setState(() {
                                    itemCount--;
                                  });
                                },
                              ),
                              Text('$itemCount'),
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  setState(() {
                                    itemCount++;
                                  });
                                },
                              ),
                            ],
                          )
                        : Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey, // Border color
                                width: 2, // Border width
                              ),
                              borderRadius: BorderRadius.zero, // Sharp corners
                            ),
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  itemCount++;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 6.0,
                                  horizontal: 16.0,
                                ),
                                child: Text(
                                  'Add to Cart',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ),
                          ),
                    SizedBox(height: 8),
                    if (itemCount > 0)
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserProfileScreen(),
                            ),
                          );
                        },
                        child: Text('View Cart'),
                      ),

                    SizedBox(height: 20),

                    Text(
                      'Other Recommended Products:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    // List of other recommended products as cards
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: otherRecommendedItems.map((item) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Card(
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          item['imagePath'],
                                          width: 120,
                                          height: 120,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(height: 8),
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
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        item['restaurant']['name'],
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
