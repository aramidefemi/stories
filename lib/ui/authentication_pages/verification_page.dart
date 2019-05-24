import 'package:flutter/material.dart';
import 'package:stories/ui/authentication_pages/forgot_password_page.dart';

class VerificationPage extends StatelessWidget {
  final String verificationMessage =
      "Code has been sent to your email address demoemail@lorem.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        automaticallyImplyLeading: true,
        title: ListTile(
          title: Text(
            "Verification",
            style: Theme.of(context)
                .textTheme
                .title
                .copyWith(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "Get a verification code",
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ListView(children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      verificationMessage,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .subhead
                          .copyWith(fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Click here to edit ",
                          style: Theme.of(context)
                              .textTheme
                              .subhead
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        InkWell(
                          child: Text(
                            "email",
                            style: Theme.of(context).textTheme.subhead.copyWith(
                                fontWeight: FontWeight.normal,
                                color: Theme.of(context).primaryColor),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ForgotPasswordPage()));
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    //TODO Allow only numbers and change textfield styling
                    TextField(
                      maxLength: 4,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(labelText: "Code"),
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                  ],
                ),
              ]),
            ),
            SizedBox(
              width: double.infinity,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(36.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 16.0),
                color: Theme.of(context).primaryColor,
                child: Text(
                  "Resend",
                  style: Theme.of(context).textTheme.title.copyWith(
                        color: Colors.white,
                      ),
                ),
                onPressed: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (_) => VerificationPage()));
                },
              ),
            ),
            SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}
