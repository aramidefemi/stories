import 'package:Stories/ui/authentication_pages/sign_in_page.dart';
import 'package:Stories/ui/main_tabs/stories_home_tabs/upload_story.dart';
import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class UploadStoryy extends StatelessWidget {
  final List<Color> dummyColorList = [
    Colors.amber,
    Colors.blue,
    Colors.brown,
    Colors.cyan,
    Colors.green,
    Colors.grey,
    Colors.indigo,
    Colors.lime,
    Colors.orange,
    Colors.pink,
    Colors.purple,
    Colors.red
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        automaticallyImplyLeading: true,
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          "Upload Story",
          style: Theme.of(context)
              .textTheme
              .title
              .copyWith(fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text("Post"),
            onPressed: () {},
            textColor: Theme.of(context).primaryColor,
          )
        ],
      ),
      //Body is wrapped SingleChildScrollView for small screen devices
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height -
              kToolbarHeight -
              MediaQuery.of(context).padding.top,
          padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
          child: Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                ),
                title: Text(
                  "Lucy Matt",
                  style: Theme.of(context).textTheme.subhead.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                subtitle: Text(
                  "@lucymat0",
                  style: Theme.of(context).textTheme.caption.copyWith(
                      // fontWeight: FontWeight.normal
                      ),
                ),
              ),
              Column(
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 10,
                    buildCounter: null,
                    decoration: InputDecoration(
                        counter: null,
                        hintText: "Express yourself",
                        contentPadding: EdgeInsets.all(8.0),
                        filled: true),
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          children: dummyColorList.map((dummyColor) {
                            return Expanded(
                                child: InkWell(
                              onTap: () {},
                              child: Container(
                                margin: EdgeInsets.all(1.0),
                                height: 32.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.0),
                                    color: dummyColor),
                              ),
                            ));
                          }).toList(),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("More"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: InkWell(
                                onTap: () {},
                                child: Center(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Icon(MdiIcons.video),
                                    Text(
                                      "Record",
                                      style: TextStyle(
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                  ],
                                )),
                              ),
                            ),
                            VerticalDivider(),
                            Expanded(
                              child: InkWell(
                                onTap: () {},
                                child: Center(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Icon(Icons.insert_photo),
                                    Text(
                                      "Photo",
                                      style: TextStyle(
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                  ],
                                )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(),
                    Expanded(
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: InkWell(
                                onTap: () {},
                                child: Center(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Icon(Icons.music_note),
                                    Text(
                                      "Add Audio",
                                      style: TextStyle(
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                  ],
                                )),
                              ),
                            ),
                            VerticalDivider(),
                            Expanded(
                              child: InkWell(
                                onTap: () {},
                                child: Center(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Icon(MdiIcons.playCircleOutline),
                                    Text(
                                      "Video",
                                      style: TextStyle(
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                  ],
                                )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

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
      // home: SignInPage(),
      // home: MyHomePage(),
      home:UploadStory(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Color> dummyColorList = [
    Colors.amber,
    Colors.blue,
    Colors.brown,
    Colors.cyan,
    Colors.green,
    Colors.grey,
    Colors.indigo,
    Colors.lime,
    Colors.orange,
    Colors.pink,
    Colors.purple,
    Colors.red
  ];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        automaticallyImplyLeading: true,
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          "Upload Story",
          style: Theme.of(context)
              .textTheme
              .title
              .copyWith(fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text("Post"),
            onPressed: () {},
            textColor: Theme.of(context).primaryColor,
          )
        ],
      ),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: new ListView(
              children:<Widget>[ Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                    ),
                    title: Text(
                      "Lucy Matt",
                      style: Theme.of(context).textTheme.subhead.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    subtitle: Text(
                      "@lucymat0",
                      style: Theme.of(context).textTheme.caption.copyWith(
                          // fontWeight: FontWeight.normal
                          ),
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 10,
                    buildCounter: null,
                    decoration: InputDecoration(
                        counter: null,
                        hintText: "Express yourself",
                        contentPadding: EdgeInsets.all(8.0),
                        filled: true),
                  ),
                ],
              ),]
            ),
          ),
          new Container(
            color: Colors.white,
            padding: new EdgeInsets.all(10.0),
            child: Column(children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: dummyColorList.map((dummyColor) {
                        return Expanded(
                            child: InkWell(
                          onTap: () {},
                          child: Container(
                            margin: EdgeInsets.all(1.0),
                            height: 32.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                color: dummyColor),
                          ),
                        ));
                      }).toList(),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("More"),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 4.0,
              ),
              Row(children: <Widget>[
                Expanded(
                  child: Material(
                    child: InkWell(onTap: () {}, child: Icon(MdiIcons.video)),
                  ),
                ),
                Expanded(
                  child: Material(
                    child: InkWell(
                      onTap: () {},
                      child: Icon(Icons.insert_photo),
                    ),
                  ),
                ),
                Expanded(
                  child: Material(
                    child: InkWell(
                      onTap: () {},
                      child: Icon(Icons.music_note),
                    ),
                  ),
                ),
                Expanded(
                  child: Material(
                    child: InkWell(
                      onTap: () {},
                      child: Icon(MdiIcons.playCircleOutline),
                    ),
                  ),
                ),
              ]),
            ]),
          ),
        ],
      ),
    );
  }
}
