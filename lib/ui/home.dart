import 'package:Stories/ui/tabs/message.dart';
import 'package:Stories/ui/tabs/notifications.dart';
import 'package:Stories/ui/tabs/stories_feed.dart';
import 'package:Stories/ui/tabs/stories_home.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final List<Widget> tabs = [
    StoriesHome(),
    StoriesFeed(),
    Notifications(),
    Message(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            //Title is set to empty Container() since title cannot be null
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_agenda),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            title: Container(),
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
