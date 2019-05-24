import 'package:stories/ui/authentication_pages/forgot_password_page.dart';
import 'package:stories/ui/authentication_pages/new_user_page.dart';
import 'package:stories/ui/home.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  SignInPage({
    Key key,
  }) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    var newUserButton = SizedBox(
      width: double.infinity,
      child: OutlineButton(
        highlightedBorderColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(36.0),
        ),
        padding: EdgeInsets.symmetric(vertical: 20.0),
        borderSide: BorderSide(
          color: Theme.of(context).primaryColor,
        ),
        child: Text(
          "New User?",
          style: Theme.of(context)
              .textTheme
              .title
              .copyWith(color: Theme.of(context).primaryColor),
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => NewUserPage()));
        },
      ),
    );

    var signInButton = SizedBox(
      width: double.infinity,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(36.0),
        ),
        padding: EdgeInsets.symmetric(vertical: 20.0),
        color: Theme.of(context).primaryColor,
        child: Text(
          "Sign In",
          style: Theme.of(context).textTheme.title.copyWith(
                color: Colors.white,
              ),
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));
        },
      ),
    );

    var appTitle = Text(
      "CatchUP",
      style: Theme.of(context).textTheme.display1.copyWith(
          color: Theme.of(context).textTheme.body1.color,
          fontFamily: "Scriptorama"),
    );

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: Theme.of(context).canvasColor,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(32.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  appTitle,
                  SizedBox(
                    height: 36.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Material(
                          child: TextField(
                        decoration: InputDecoration(labelText: "Email Address"),
                      )),
                      SizedBox(
                        height: 24.0,
                      ),
                      Material(
                          child: Stack(
                              alignment: Alignment(1.0, 0.0),
                              children: <Widget>[
                            TextField(
                              decoration: InputDecoration(
                                labelText: "Password",
                              ),
                            ),
                            Positioned(
                              child: FlatButton(
                                child: Text(
                                  "Forgot?",
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              ForgotPasswordPage()));
                                },
                              ),
                            )
                          ])),
                      SizedBox(
                        height: 36.0,
                      ),
                    ],
                  ),
                  signInButton,
                  SizedBox(
                    height: 16.0,
                  ),
                  newUserButton,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
