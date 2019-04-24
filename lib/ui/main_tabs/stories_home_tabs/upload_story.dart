import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

class UploadStory extends StatefulWidget {
  @override
  _UploadStoryState createState() => _UploadStoryState();
}

class _UploadStoryState extends State<UploadStory> {
  List<Color> dummyColorList = [
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

  KeyboardVisibilityNotification keyboardVisibilityNotification =
      KeyboardVisibilityNotification();

  bool _keyboardIsVisible = false;

  int _keyboardVisibilitySubscriberId;

  @override
  void initState() {
    super.initState();
//The keyboard visibility is used to adjust the upload story action buttons from grid to list
    _keyboardVisibilitySubscriberId =
        keyboardVisibilityNotification.addNewListener(onChange: (bool visible) {
      setState(() {
        _keyboardIsVisible = visible;
      });
    });
  }

  @override
  void dispose() {
    keyboardVisibilityNotification
        .removeListener(_keyboardVisibilitySubscriberId);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var actionsList = Row(children: <Widget>[
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
    ]);

    var actionsGrid = Expanded(
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
                                color: Theme.of(context).primaryColor),
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
                                color: Theme.of(context).primaryColor),
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
                                color: Theme.of(context).primaryColor),
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
                                color: Theme.of(context).primaryColor),
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
    );
    return Scaffold(
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
            onPressed: () {
            },
            textColor: Theme.of(context).primaryColor,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: ListView(children: <Widget>[
                Column(
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
                ),
              ]),
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
            _keyboardIsVisible ? actionsList : actionsGrid
          ],
        ),
      ),
    );
  }
}
