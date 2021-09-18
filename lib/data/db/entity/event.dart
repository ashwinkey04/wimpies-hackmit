import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Event {
  String id;
  String name;
  String location;
  DateTime time;
  // String image;


  Event({@required this.id, @required this.name, @required this.location});

  Event.fromSnapshot(DocumentSnapshot snapshot) {
    id = snapshot['id'];
    name = snapshot['name'];
    location = snapshot['location'];

  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'location': location
    };
  }
}
