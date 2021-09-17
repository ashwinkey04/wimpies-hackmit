import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppIconTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: Image.asset('images/makefg.png'),
            width: 46.0,
            height: 46.0,
          ),
          SizedBox(width: 5.0),
          Text(
            'Kaigi',
            style: Theme.of(context).textTheme.headline2,
          )
        ],
      ),
    );
  }
}
