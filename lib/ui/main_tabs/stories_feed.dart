import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class StoriesFeed extends StatelessWidget {
  const StoriesFeed({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Stories",
          style: Theme.of(context)
              .textTheme
              .title
              .copyWith(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).canvasColor,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.person,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, childAspectRatio: 1 / 1),
        itemCount: 20,
        scrollDirection: Axis.vertical,
        itemBuilder: ((BuildContext context, int index) {
          return Card(
            child: Column(
              children: <Widget>[
                ListTile(
                    onTap: () {},
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
                      "Today 10:00am",
                      style: Theme.of(context).textTheme.caption.copyWith(),
                    ),
                    trailing: index == 0
                        ? OutlineButton(
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                            ),
                            highlightedBorderColor:
                                Theme.of(context).primaryColor,
                            onPressed: () {},
                            child: Text("Promote"),
                          )
                        : null),
                Expanded(
                  child: Container(
                    color: Colors.red.withOpacity(0.2),
                  ),
                ),
                Container(
                  height: kBottomNavigationBarHeight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(MdiIcons.eyeOutline),
                          SizedBox(
                            width: 4.0,
                          ),
                          Text("2.9k")
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(MdiIcons.twitterRetweet),
                          SizedBox(
                            width: 4.0,
                          ),
                          Text("5.2k")
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(MdiIcons.commentOutline),
                          SizedBox(
                            width: 4.0,
                          ),
                          Text("0.9k")
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            MdiIcons.heartOutline,
                            color: index == 0
                                ? Theme.of(context).primaryColor
                                : null,
                          ),
                          SizedBox(
                            width: 4.0,
                          ),
                          Text("1.9k")
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
