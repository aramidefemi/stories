import 'package:Stories/ui/authentication_pages/new_user_page.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  SignInPage({
    Key key,
  }) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}
//TODO Remove blue highlight color from outline button

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    var newUserButton = SizedBox(
      width: double.infinity,
      child: OutlineButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        padding: EdgeInsets.symmetric(vertical: 24.0),
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
          borderRadius: BorderRadius.circular(5.0),
        ),
        padding: EdgeInsets.symmetric(vertical: 24.0),
        color: Theme.of(context).primaryColor,
        child: Text(
          "Sign In",
          style: Theme.of(context).textTheme.title.copyWith(
                color: Colors.white,
              ),
        ),
        onPressed: () {},
      ),
    );
    var appTitle = Text(
      "Stories",
      style: Theme.of(context).textTheme.display2,
    );

    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).canvasColor,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                appTitle,
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Material(
                        child: TextField(
                      decoration: InputDecoration(labelText: "Email Address"),
                    )),
                    SizedBox(
                      height: 16.0,
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
                              onPressed: () {},
                            ),
                          )
                        ])),
                    SizedBox(
                      height: 32.0,
                    ),
                    signInButton,
                  ],
                ),
                newUserButton,
              ],
            ),
          ),
        ),
      ),
    );
  }
}