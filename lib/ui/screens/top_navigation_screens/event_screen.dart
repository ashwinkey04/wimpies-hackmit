import 'package:flutter/material.dart';
import 'package:tinder_app_flutter/data/db/remote/firebase_database_source.dart';
import 'package:tinder_app_flutter/ui/widgets/add_event.dart';
import 'package:tinder_app_flutter/ui/widgets/input_dialog.dart';
import 'package:tinder_app_flutter/util/constants.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key key}) : super(key: key);

  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  final FirebaseDatabaseSource _databaseSource = FirebaseDatabaseSource();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        floatingActionButton: FloatingActionButton(
          backgroundColor: kAccentColor,
          foregroundColor: kSecondaryColor,
          child: Icon(Icons.add),
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => AddEventDialog(
                onSavePressed: (value) {},
                labelText: 'Bio',
                startInputText: 'Yo',
              ),
            );
          },
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: kDefaultPadding,
              child: Text(
                'Events',
                style: Theme.of(context).textTheme.headline3,
              ),
            )
          ],
        ));
  }
}
