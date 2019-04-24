import 'package:Stories/ui/main_tabs/message.dart';
import 'package:Stories/ui/main_tabs/notifications.dart';
import 'package:Stories/ui/main_tabs/stories_feed.dart';
import 'package:Stories/ui/main_tabs/stories_home.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
            icon: Icon(MdiIcons.libraryBooks),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.messageTextOutline),
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
