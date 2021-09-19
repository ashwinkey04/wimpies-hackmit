import 'package:flutter/material.dart';
import 'package:tinder_app_flutter/data/db/remote/firebase_database_source.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key key}) : super(key: key);

  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  final FirebaseDatabaseSource _databaseSource = FirebaseDatabaseSource();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  GoogleMapController _controller;
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Events',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: GoogleMap(
              mapType: MapType.hybrid,
              initialCameraPosition: CameraPosition(
                  target: LatLng(37.42796133580664, -122.085749655962),
                  zoom: 14.4746,
              ),
              onMapCreated: (GoogleMapController controller) {
                _controller = controller;
              },
            ),
            ),
          ],
        ));
  }
}
