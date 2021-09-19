import 'package:flutter/material.dart';

void main() => runApp(Cards());

/// This Widget is the main application widget.
class Cards extends StatelessWidget {
  static const String _title = 'Food App Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          children: <Widget>[
            for (int i = 0; i < 2; i++) MyStatelessWidget(),
          ],
        ),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          color: Colors.yellow[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // if you need this
            side: BorderSide(
              color: Colors.grey.withOpacity(.2),
              width: 1,
            ),
          ),
          child: Container(
            width: 400,
            height: 200,
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
                            child: Text(
                              'Beer Party',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Text(
                            '18+',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.black,
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
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        SizedBox(
                          width: 0,
                        ),
                        // Icon(
                        //   Icons.confirmation_num_rounded,
                        //   size: 12,
                        // ),
                        Text(
                          'California, USA',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'DATE',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        Text(
                          '28 Feb 2020',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'TIME',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        Text(
                          '1:36 PM',
                          style: TextStyle(
                            color: Colors.black,
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
        ),
      ],
    );
  }
}
