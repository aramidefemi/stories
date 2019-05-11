import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class EditProfile extends StatelessWidget {
  TextEditingController fullnameController =
      TextEditingController(text: "Lucy Matt");
  TextEditingController usernameController =
      TextEditingController(text: "LucyMatt0");
  TextEditingController phonenumberController =
      TextEditingController(text: "0903333398");
  TextEditingController emailController =
      TextEditingController(text: "lucymat@mymail.com");
  TextEditingController genderController =
      TextEditingController(text: "Female");
  TextEditingController languageController =
      TextEditingController(text: "English");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Theme.of(context).canvasColor,
          iconTheme: IconThemeData(color: Colors.black),
          actions: <Widget>[
            FlatButton(
              child: Text("Continue"),
              onPressed: () {
                Navigator.pop(context);
              },
              textColor: Theme.of(context).primaryColor,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - kToolbarHeight,
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    child:
                        Stack(alignment: Alignment.topRight, children: <Widget>[
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                          
                          "dummyImageUrl" + "student?random=",
                          
                        ),
                      ),
                      Positioned(
                        child: Container(
                          height: 24.0,
                          width: 24.0,
                          child: SizedBox.shrink(
                              child: Center(
                            child: Icon(Icons.camera_alt, color: Colors.white,size: 20.0,),
                            
                          )),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      )
                    ]),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        TextField(
                          controller: fullnameController,
                          decoration: InputDecoration(labelText: "Full Name"),
                        ),
                        TextField(
                          controller: usernameController,
                          decoration: InputDecoration(labelText: "Username"),
                        ),
                        TextField(
                          controller: phonenumberController,
                          decoration:
                              InputDecoration(labelText: "Phone Number"),
                        ),
                        TextField(
                          controller: emailController,
                          decoration:
                              InputDecoration(labelText: "Email Address"),
                        ),
                        Stack(
                            alignment: Alignment(1.0, 0.0),
                            children: <Widget>[
                              TextField(
                                controller: genderController,
                                enabled: false,
                                decoration:
                                    InputDecoration(labelText: "Select Gender"),
                              ),
                              Positioned(
                                child: IconButton(
                                  icon:
                                      Icon(MdiIcons.arrowDownDropCircleOutline),
                                  onPressed: () {},
                                ),
                              ),
                            ]),
                        Stack(
                            alignment: Alignment(1.0, 0.0),
                            children: <Widget>[
                              TextField(
                                controller: languageController,
                                enabled: false,
                                decoration: InputDecoration(
                                    labelText: "Preferred Language"),
                              ),
                              Positioned(
                                child: IconButton(
                                  icon:
                                      Icon(MdiIcons.arrowDownDropCircleOutline),
                                  onPressed: () {},
                                ),
                              ),
                            ]),
                      ],
                    ),
                  ),
                ]),
          ),
        ));
  }
}
