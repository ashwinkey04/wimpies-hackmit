import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Event {
  String id;
  String name;
  String placeID;
  String time;
  String date;
  // String image;

  Event({this.id, @required this.name, @required this.placeID, this.time, this.date});

  Event.fromSnapshot(DocumentSnapshot snapshot) {
    id = snapshot['id'];
    name = snapshot['name'];
    placeID = snapshot['placeID'];
    time = snapshot['time'];
    date = snapshot['date'];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'placeID': placeID,
      'time': time,
      'date': date
    };
  }
}
