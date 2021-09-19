import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tinder_app_flutter/data/db/entity/event.dart';
import 'package:tinder_app_flutter/data/db/remote/firebase_database_source.dart';
import 'package:tinder_app_flutter/ui/widgets/add_event.dart';
import 'package:tinder_app_flutter/util/constants.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key key}) : super(key: key);

  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  final FirebaseDatabaseSource _databaseSource = FirebaseDatabaseSource();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  Future eventsFuture;

  Future<List<Event>> getEvents() async {
    QuerySnapshot res = await _databaseSource.getEvents();
    if (res.docs.length > 0) {
      int i = 0;
      List<Event> _allEvents = [];
      for (; i < res.docs.length; i++) {
        var _docs = res.docs[i];
        var _event = Event.fromSnapshot(
            await _databaseSource.getEventById(res.docs[i].id));
        _allEvents.add(_event);
      }
      return _allEvents;
    } else {
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    eventsFuture = getEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Events'),
        centerTitle: true,
      ),
      key: _scaffoldKey,
      body: Stack(
        children: [
          FutureBuilder(
              future: getEvents(),
              builder: (context, snap) {
                if (snap.hasData) {
                  return ListView.builder(
                      padding: EdgeInsets.all(8),
                      itemCount: snap.data.length,
                      itemBuilder: (context, int index) {
                        return Container(
                          height: 100,
                          width: 300,
                          child: Text(
                            '${snap.data[index].name}',
                            style: TextStyle(color: Colors.amber),
                          ),
                        );
                      });
                } else
                  return SizedBox();
              })
        ],
      ),
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
          getEvents();
        },
      ),
    );
  }
}
