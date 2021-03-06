import 'package:stories/ui/authentication_pages/verification_page.dart';
import 'package:flutter/material.dart';

class NewUserPage extends StatelessWidget {
  String _genderValue;

  final String verificationMessage =
      "We'll send verification code to the above email to verify";
  @override
  Widget build(BuildContext context) {
    var signInButton = SizedBox(
      width: double.infinity,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(36.0),
        ),
        padding: EdgeInsets.symmetric(vertical: 16.0),
        color: Theme.of(context).primaryColor,
        child: Text(
          "Sign In",
          style: Theme.of(context).textTheme.title.copyWith(
                color: Colors.white,
              ),
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => VerificationPage()));
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
            padding: EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: "Full Name"),
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Email Address"),
                ),
                StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return DropdownButtonFormField(
                      items: [
                        DropdownMenuItem(
                          value: "Male",
                          child: Text(
                            "Male",
                          ),
                        ),
                        DropdownMenuItem(
                          value: "Female",
                          child: Text(
                            "Female",
                          ),
                        ),
                      ],
                      onChanged: (selectedGender) {
                        setState(() {
                          _genderValue = selectedGender;
                        });
                      },
                      value: _genderValue,
                      decoration: InputDecoration(
                        labelText: "Select Gender",
                      ),
                    );
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Password"),
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Phone Number"),
                ),
                signInButton,
                SizedBox(height: 8.0),
                verificationText,
              ],
            ),
          ),
        ));
  }
}
