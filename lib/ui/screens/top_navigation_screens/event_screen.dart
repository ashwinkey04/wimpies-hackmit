import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:tinder_app_flutter/data/db/entity/event.dart';
import 'package:tinder_app_flutter/data/db/remote/firebase_database_source.dart';
import 'package:tinder_app_flutter/ui/widgets/add_event.dart';
import 'package:tinder_app_flutter/ui/widgets/custom_modal_progress_hud.dart';
import 'package:tinder_app_flutter/ui/widgets/event_card.dart';
import 'package:tinder_app_flutter/util/constants.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key key}) : super(key: key);

  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  final FirebaseDatabaseSource _databaseSource = FirebaseDatabaseSource();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> places = [];
  String kGoogleApiKey;
  GoogleMapsPlaces _googleMapsPlaces;
  Future eventFuture;

  @override
  initState() {
    super.initState();
    getPlacesKey();
    eventFuture = getEvents();
  }

  getPlacesKey() async {
    var k = new DotEnv();
    await k.load();
    kGoogleApiKey = k.env['PLACES_KEY'];
    _googleMapsPlaces = GoogleMapsPlaces(apiKey: kGoogleApiKey);
  }

  Future<List<Event>> getEvents() async {
    QuerySnapshot res = await _databaseSource.getEvents();
    if (res.docs.length > 0) {
      int i = 0;
      List<Event> _allEvents = [];
      for (; i < res.docs.length; i++) {
        var _docs = res.docs[i];
        var _event = Event.fromSnapshot(
            await _databaseSource.getEventById(res.docs[i].id));
        var placesDetail =
            await _googleMapsPlaces.getDetailsByPlaceId(_event.placeID);
        places.add(placesDetail.result.name);
        _allEvents.add(_event);
      }
      return _allEvents;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    var futureBuilder = new FutureBuilder(
        future: eventFuture,
        builder: (context, snap) {
          return CustomModalProgressHUD(
              inAsyncCall: !snap.hasData,
              child: snap.hasData
                  ? ListView.builder(
                      padding: EdgeInsets.all(8),
                      itemCount: snap.data.length,
                      itemBuilder: (context, int index) {
                        Event _curr = snap.data[index];
                        return EventCard(
                            name: _curr.name,
                            host: _curr.hostName,
                            date: _curr.date,
                            time: _curr.time,
                            location: places[index]);
                      })
                  : SizedBox());
        });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Events'),
        centerTitle: true,
      ),
      key: _scaffoldKey,
      body: futureBuilder,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kAccentColor,
        foregroundColor: kSecondaryColor,
        child: Icon(Icons.add),
        onPressed: () async {
          showDialog(
            context: context,
            builder: (_) => AddEventDialog(
              onSavePressed: (event) {
                _databaseSource.addEvent(event);
              },
            ),
          );
          setState(() {
            eventFuture = getEvents();
          });
        },
      ),
    );
  }
}
