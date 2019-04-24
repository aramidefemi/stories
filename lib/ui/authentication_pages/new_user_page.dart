import 'package:Stories/ui/home.dart';
import 'package:flutter/material.dart';

class NewUserPage extends StatelessWidget {
  String verificationMessage =
      "We'll send verification code to the above email to verify";
  @override
  Widget build(BuildContext context) {
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
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));
        },
      ),
    );

    var verificationText = Text(
      verificationMessage,
      textAlign: TextAlign.center,
      style: Theme.of(context)
          .textTheme
          .subhead
          .copyWith(fontWeight: FontWeight.normal),
    );
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).canvasColor,
          automaticallyImplyLeading: true,
          title: ListTile(
            title: Text(
              "New user?",
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "Register now to continue",
              style: Theme.of(context)
                  .textTheme
                  .subtitle
                  .copyWith(fontWeight: FontWeight.normal),
            ),
            contentPadding: EdgeInsets.all(0.0),
          ),
          titleSpacing: 0.0,
          elevation: 0.0,
          iconTheme: Theme.of(context).iconTheme.copyWith(opacity: 0.5),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - kToolbarHeight,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        TextField(
                          decoration: InputDecoration(labelText: "Full Name"),
                        ),
                        TextField(
                          decoration:
                              InputDecoration(labelText: "Email Address"),
                        ),
                        Stack(
                            alignment: Alignment(1.0, 0.0),
                            children: <Widget>[
                              TextField(
                                decoration:
                                    InputDecoration(labelText: "Select Gender"),
                              ),
                              Positioned(
                                child: IconButton(
                                  icon: Icon(
                                    Icons.arrow_drop_down_circle,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ]),
                        TextField(
                          decoration: InputDecoration(labelText: "Password"),
                        ),
                        TextField(
                          decoration:
                              InputDecoration(labelText: "Phone Number"),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    signInButton,
                    SizedBox(height: 8.0),
                    verificationText,
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
