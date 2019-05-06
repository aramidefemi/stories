import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stories/resources/dummy_data.dart';

class UserStories extends StatefulWidget {
  final String storyImageUrl;

  const UserStories({Key key, @required this.storyImageUrl}) : super(key: key);

  @override
  _UserStoriesState createState() => _UserStoriesState();
}

class _UserStoriesState extends State<UserStories> {
  num storieslength = 4;

  final dummyImageUrl = DummyData.dummyImageUrl;

  double storiesDetailsOpacity = 1;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Color primaryColor = theme.primaryColor;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    double storiesIndicatorHeight = screenHeight * 0.015;

    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onLongPress: () {
            setState(() {
              storiesDetailsOpacity = 0.0;
            });
          },
          onLongPressUp: () {
            setState(() {
              storiesDetailsOpacity = 1.0;
            });
          },
          onVerticalDragEnd: (DragEndDetails dragEndDetails) {
            Navigator.of(context).pop();
          },
          // child: 
          // Hero(
            // tag: widget.storyImageUrl,
                      child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  widget.storyImageUrl,
                ),
              )),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[Colors.black12, Colors.black12],
                    stops: [0.1, 0.5],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                padding: EdgeInsets.only(
                    left: storiesIndicatorHeight,
                    top: storiesIndicatorHeight,
                    right: storiesIndicatorHeight,
                    bottom: 2 * storiesIndicatorHeight),
                child: AnimatedOpacity(
                    opacity: storiesDetailsOpacity,
                    duration: Duration(milliseconds: 1000),
                    child: Material(
                      color: Colors.transparent,
                                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                height: storiesIndicatorHeight,
                                child: Row(
                                  children: List.generate(storieslength, (index) {
                                    return Expanded(
                                        child: Container(
                                      margin: EdgeInsets.only(
                                          left: index == 0
                                              ? 0
                                              : screenWidth / (20 * storieslength),
                                          right: index == storieslength - 1
                                              ? 0
                                              : screenWidth / (20 * storieslength)),
                                      child: Container(
                                        color: primaryColor,
                                      ),
                                    ));
                                  }),
                                ),
                              ),
                              ListTile(
                                  onTap: () {},
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      dummyImageUrl + "model,black,1",
                                    ),
                                  ),
                                  title: Text(
                                    "Lucy Matt",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subhead
                                        .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                  ),
                                  subtitle: Text(
                                    "@lucymat0",
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption
                                        .copyWith(color: Colors.white),
                                  ),
                                  trailing: IconButton(
                                    icon: Icon(Icons.close),
                                    color: Colors.white,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              StoriesStatItem(
                                statIcon: MdiIcons.eyeOutline,
                                statText: "2.9k",
                              ),
                              StoriesStatItem(
                                statIcon: MdiIcons.libraryBooks,
                              ),
                              StoriesStatItem(
                                statIcon: MdiIcons.messageTextOutline,
                                statText: "0.9k",
                              ),
                              StoriesStatItem(
                                statIcon: MdiIcons.heartOutline,
                                statText: "1.9k",
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ),
        // ),
      ),
    );
  }
}

class StoriesStatItem extends StatelessWidget {
  final IconData statIcon;
  final String statText;

  const StoriesStatItem({Key key, @required this.statIcon, this.statText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon((statIcon), color: Colors.white),
        SizedBox(width: 4.0),
        Text(statText ?? "",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
      ],
    );
  }
}
