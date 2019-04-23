import 'package:Stories/custom_widgets/custom_input_decoration.dart';
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
        onPressed: () {},
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
                        child: TextField(
                          //TODO Show suffix when textfield is not in focus
                      decoration: InputDecoration(
                          suffix: FlatButton(
                            child: Text(
                              "Forgot",
                            ),
                            onPressed: () {},
                          ),
                          hintText: "Password"),
                    )),
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
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
