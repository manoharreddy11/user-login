import 'package:flutter/material.dart';
import 'package:flutter_food_app/screens/food_list.dart';
import 'package:flutter_food_app/screens/search.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController = ScrollController();

  bool _isTabVisible = false;
  bool _isCategoryVisible = false;

  List<String> categoriesList = [
    'Explore categories',
    'Cheese',
    'Gift',
    'Snacks',
    'Butter',
    'Dips',
    'Honey',
    'Condiments',
    'Other',
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels == 0) {
      setState(() {
        _isCategoryVisible = false; // Hide category when at the top
        _isTabVisible = true;
      });
    } else if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      setState(() {
        _isCategoryVisible = true; // Show category when at the bottom
        _isTabVisible = true;
      });
    } else {
      setState(() {
        _isTabVisible = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[200],
      body: Stack(
        children: [
          NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  backgroundColor: Colors.lightBlue[200],
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hand Toss Pizza Expert',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (_isTabVisible) // Show TabBar only when _isTabVisible is true
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.search),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SearchScreen(),
                                  ),
                                );
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.message),
                              onPressed: () {
                                // Add your message functionality here
                              },
                            ),
                          ],
                        ),
                    ],
                  ),
                  floating: true,
                  pinned: true,
                ),
              ];
            },
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Card(
                        margin: EdgeInsets.all(8.0),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  'Welcome to our Pizza App! Discover a world of deliciousness with our wide range of mouth-watering pizzas.',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Icon(Icons.favorite),
                                  SizedBox(width: 4),
                                  Text(
                                    '3.7k Love this',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Icon(Icons.location_on),
                                  SizedBox(width: 4),
                                  Text(
                                    'work-500081 >',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Hand Toss Pizza delivers in 2-3 days',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text('Delivery charges will apply.'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverFillRemaining(
                  child: Container(
                    color: Colors.white,
                    child: FoodList(),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 90,
            left: MediaQuery.of(context).size.width / 1.75 - 100,
            child: GestureDetector(
              onTap: () {
                _showCategoriesList(context);
              },
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 300),
                opacity: _isCategoryVisible ? 1.0 : 0.0,
                child: Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8.0),
                    child: Row(
                      children: [
                        Text('Categories'),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showCategoriesList(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Categories'),
          content: SingleChildScrollView(
            child: ListBody(
              children: categoriesList
                  .map(
                    (category) => Column(
                      children: [
                        ListTile(
                          title: Text(category),
                          onTap: () {
                            print('Selected Category: $category');
                            Navigator.pop(context);
                          },
                        ),
                        Divider(), // Add divider between list tiles
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}
