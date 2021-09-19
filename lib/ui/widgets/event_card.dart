import 'package:flutter/material.dart';
import 'package:tinder_app_flutter/util/constants.dart';

class EventCard extends StatelessWidget {
  final String name;
  final String host;
  final String date;
  final String time;
  final String location;

  EventCard(
      {@required this.name,
      @required this.host,
      @required this.date,
      @required this.time,
      @required this.location});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey[900],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30), // if you need this
        side: BorderSide(
          color: kAccentColor,
          width: 1,
        ),
      ),
      shadowColor: Colors.black,
      elevation: 15,
      child: Container(
        width: 400,
        height: 220,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(18.0, 12.0, 8.0, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 3.0, 0, 0),
                        child: Hero(
                          tag: 'name',
                          child: Text(
                            name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Hosted by: ' + host,
                        style: TextStyle(color: Colors.white54),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.white,
              thickness: .2,
              indent: 8,
              endIndent: 8,
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.fromLTRB(25.0, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'LOCATION',
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                    SizedBox(
                      width: 0,
                    ),
                    // Icon(
                    //   Icons.confirmation_num_rounded,
                    //   size: 12,
                    // ),
                    Container(
                      height: 20,
                      child: Text(
                        location,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'DATE',
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                    Text(
                      date,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'TIME',
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
