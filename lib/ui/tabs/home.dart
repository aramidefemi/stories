import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Stories",
          style: Theme.of(context)
              .textTheme
              .title
              .copyWith(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).canvasColor,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              child: Text("X"),
            ),
          )
        ],
      ),
    );
  }
}
