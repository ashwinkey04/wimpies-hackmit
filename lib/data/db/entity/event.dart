import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Event {
  String hostName;
  String name;
  String placeID;
  String time;
  String date;
  String eventDesc;
  // String image;

  Event(
      {this.hostName,
      @required this.name,
      @required this.placeID,
      this.time,
      this.date,
      this.eventDesc});

  Event.fromSnapshot(DocumentSnapshot snapshot) {
    hostName = snapshot['hostName'];
    name = snapshot['name'];
    placeID = snapshot['placeId'];
    time = snapshot['time'];
    date = snapshot['date'];
    eventDesc = snapshot['eventDesc'];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'hostName': hostName,
      'name': name,
      'placeID': placeID,
      'time': time,
      'date': date,
      'eventDesc':eventDesc,
    };
  }
}
