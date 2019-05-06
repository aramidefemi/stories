import 'package:stories/ui/authentication_pages/sign_in_page.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stories',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(252, 13, 27, 1),
        accentColor: Color.fromRGBO(252, 13, 27, 1),
      ),
      home: 
      SignInPage(),
    );
  }
}
