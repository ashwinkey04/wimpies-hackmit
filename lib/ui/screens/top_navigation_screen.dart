import 'package:flutter/material.dart';
import 'package:tinder_app_flutter/ui/screens/top_navigation_screens/event_screen.dart';
import 'package:tinder_app_flutter/ui/screens/top_navigation_screens/profile_screen.dart';
import 'top_navigation_screens/chats_screen.dart';
import 'top_navigation_screens/match_screen.dart';

class TopNavigationScreen extends StatefulWidget {
  static const String id = 'top_navigation_screen';

  @override
  _TopNavigationScreenState createState() => _TopNavigationScreenState();
}

class _TopNavigationScreenState extends State<TopNavigationScreen> {
  int _currentIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new EventScreen();
        
      case 1:
        return new ChatsScreen();
      case 2:
        return new MatchScreen();
      case 3:
        return new ProfileScreen();

      default:
        return new Text("Error");
    }
  }

  List<String> titleList = ["Profile", "Chat", "Match", "Events"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Kaigi'),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        // selectedLabelStyle: Colors.white,
        // unselectedLabelStyle: textTheme.caption,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            title: Text('Events'),
            icon: Icon(Icons.attractions_rounded),
          ),
          BottomNavigationBarItem(
            title: Text('Messages'),
            icon: Icon(Icons.message_rounded),
          ),
          BottomNavigationBarItem(
            title: Text('Meet'),
            icon: Icon(Icons.group_outlined),
          ),
          BottomNavigationBarItem(
            title: Text('Profile'),
            icon: Icon(Icons.person),
          ),
        ],
      ),
      body: _getDrawerItemWidget(_currentIndex),
    );
  }
}
