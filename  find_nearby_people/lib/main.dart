import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geoflutterfire/geoflutterfire.dart';

void main() {
  runApp(NearbyPeopleListApp());
}

class NearbyPeopleListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nearby People List',
      home: NearbyPeopleListPage(),
    );
  }
}

class NearbyPeopleListPage extends StatefulWidget {
  @override
  _NearbyPeopleListPageState createState() => _NearbyPeopleListPageState();
}

class _NearbyPeopleListPageState extends State<NearbyPeopleListPage> {
  late GeoFirePoint myLocation;
  final geo = Geoflutterfire();
  late Stream<List<DocumentSnapshot>> nearbyUsersStream;

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  Future<void> _getUserLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    myLocation = geo.point(
      latitude: position.latitude,
      longitude: position.longitude,
    );

    setState(() {
      nearbyUsersStream = geo
          .collection(
              collectionRef: FirebaseFirestore.instance.collection('users'))
          .within(
            center: myLocation,
            radius: 1000, // 1000 meters (1 km)
            field: 'position',
            strictMode: true,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nearby People List'),
      ),
      body: StreamBuilder<List<DocumentSnapshot>>(
        stream: nearbyUsersStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No nearby people found.'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final user = snapshot.data![index];
              return ListTile(
                title: Text(user['name']),
                subtitle: Text(
                    'Distance: ${user['distance'].toStringAsFixed(2)} meters'),
              );
            },
          );
        },
      ),
    );
  }
}
