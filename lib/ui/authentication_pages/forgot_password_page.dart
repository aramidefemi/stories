import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stories/ui/authentication_pages/verification_page.dart';

class ForgotPasswordPage extends StatelessWidget {
  final String verificationMessage =
      "Enter your email address to get a link to reset your password";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).canvasColor,
          automaticallyImplyLeading: true,
          title: ListTile(
            title: Text(
              "Forgot Password",
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "Register a new password",
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
        body: Container(
          height: MediaQuery.of(context).size.height - kToolbarHeight,
          padding: EdgeInsets.all(32.0),
          child: Column(
            children: <Widget>[
              Image.asset("images/padlock_icon.png"),
              SizedBox(height: 36.0),
              Text(
                verificationMessage,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .subhead
                    .copyWith(fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 36.0),
              TextField(
                decoration: InputDecoration(
                    hintText: "Email Address",
                    prefixIcon: Icon(MdiIcons.emailOutline)),
              ),
              SizedBox(height: 36.0),
              SizedBox(
                width: double.infinity,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(36.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    "Send",
                    style: Theme.of(context).textTheme.title.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  onPressed: () {
                     Navigator.push(
              context, MaterialPageRoute(builder: (_) => VerificationPage()));
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
