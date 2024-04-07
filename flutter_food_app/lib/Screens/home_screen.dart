import 'package:flutter/material.dart';
import 'package:flutter_food_app/screens/food_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController = ScrollController();

  bool _isScrollingForward = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.axisDirection == AxisDirection.down) {
      setState(() {
        _isScrollingForward = true;
      });
    } else {
      setState(() {
        _isScrollingForward = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[200],
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.brown[200],
              title: Text('Pizza App'),
              actions: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    // Add your search functionality here
                  },
                ),
                IconButton(
                  icon: Icon(Icons.message),
                  onPressed: () {
                    // Add your message functionality here
                  },
                ),
              ],
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
                          Text(
                            'Hand Toss Pizza Expert',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Welcome to our Pizza App! Discover a world of deliciousness with our wide range of mouth-watering pizzas.',
                            style: TextStyle(fontSize: 16),
                          ),
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
    );
  }
}
