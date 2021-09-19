import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Event {
  String hostName;
  String name;
  String placeID;
  String time;
  String date;
  // String image;

  Event(
      {this.hostName,
      @required this.name,
      @required this.placeID,
      this.time,
      this.date});

  Event.fromSnapshot(DocumentSnapshot snapshot) {
    hostName = snapshot['hostName'];
    name = snapshot['name'];
    placeID = snapshot['placeId'];
    time = snapshot['time'];
    date = snapshot['date'];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'hostName': hostName,
      'name': name,
      'placeID': placeID,
      'time': time,
      'date': date
    };
  }
}
