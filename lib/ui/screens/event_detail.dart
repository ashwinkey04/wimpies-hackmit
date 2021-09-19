import 'package:flutter/material.dart';

class EventDetail extends StatelessWidget {
  final String name;
  final String host;
  final String date;
  final String time;
  final String location;
  final String desc;

  EventDetail({
    @required this.name,
    @required this.host,
    @required this.date,
    @required this.time,
    @required this.location,
    @required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Material(
          type: MaterialType.transparency,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.transparent,
                child: Text(name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    )),
              ),
              Text(host, style: TextStyle(color: Colors.white54)),
              Divider(
                color: Colors.white,
                thickness: .2,
                indent: 8,
                endIndent: 8,
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Icon(
                    Icons.date_range,
                    size: 24,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(date,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      )),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Icon(
                    Icons.timer,
                    size: 24,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(time,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      )),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Flexible(
                // width: double.infinity,
                // height: 150,
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 24,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Flexible(
                      child: Text(location,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            // overflow: TextOverflow.fade,
                            fontWeight: FontWeight.w600,
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Flexible(
                // width: double.infinity,
                // height: 200,
                child: Row(
                  children: [
                    Icon(
                      Icons.notes,
                      size: 24,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Flexible(
                      child: Text(desc,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            // overflow: TextOverflow.fade,
                            fontWeight: FontWeight.w600,
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
