import 'package:Stories/ui/main_tabs/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class StoriesFeed extends StatelessWidget {
  final dummyImageUrl = DummyData.dummyImageUrl;

  StoriesFeed({
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
              .headline
              .copyWith(fontFamily: "Scriptorama"),
        ),
        backgroundColor: Theme.of(context).canvasColor,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 16.0),
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                dummyImageUrl + "bella",
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
                      backgroundImage: NetworkImage(
                        dummyImageUrl + "model,black,1",
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
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                dummyImageUrl + "dogs, cute?random=${index*index}"))),
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
