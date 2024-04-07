import 'package:flutter/material.dart';
import 'package:flutter_food_app/screens/food_list.dart';
import 'package:flutter_food_app/screens/search.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController = ScrollController();

  bool _isScrollingForward = true;
  bool _isTabVisible = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.axisDirection == AxisDirection.down) {
      setState(() {
        _isScrollingForward = true;
        _isTabVisible = true;
      });
    } else {
      setState(() {
        _isScrollingForward = false;
        _isTabVisible = false;
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
              controller: _scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.only(top: _isScrollingForward ? 0 : 100),
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
            child: _isTabVisible
                ? Card(
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
                  )
                : SizedBox(),
          ),
        ],
      ),
    );
  }
}
