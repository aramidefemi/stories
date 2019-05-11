import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stories/resources/dummy_data.dart';
import 'package:stories/ui/main_tabs/stories_feed_screens/image_details.dart';
import 'package:stories/ui/main_tabs/stories_home_screens/stories.dart';

class OtherUserProfile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<OtherUserProfile>
    with TickerProviderStateMixin {
  var dummyImageUrl = DummyData.dummyImageUrl;

  TabController tabController;
  TabController tabControllerStories;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(vsync: this, length: 2);
    tabControllerStories = new TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    tabController.dispose();
    tabControllerStories.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var gridStoriesWidget = GridView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 20,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 2 / 3),
      itemBuilder: ((BuildContext context, int index) {
        var storyImageUrl = dummyImageUrl + "people?random=${index * index}";
        return Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => UserStories(
                            storyImageUrl: storyImageUrl,
                          )));
            },
            child: Stack(alignment: Alignment(0.0, 0.9), children: <Widget>[
              // Hero(
              // tag: storyImageUrl,
              // child:
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        storyImageUrl,
                      )),
                  //The gradient is added so the white text can be seen against images with white/bright backgrounds
                  gradient: LinearGradient(
                    colors: <Color>[Colors.black12, Colors.black12],
                    stops: [0.1, 0.5],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                // ),
              ),
              Positioned(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => OtherUserProfile()));
                      },
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          dummyImageUrl + "ladies?random=${index * index}",
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(MdiIcons.eyeOutline, color: Colors.white),
                        SizedBox(width: 4.0),
                        Text("2.9k",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ],
                    ),
                  ],
                ),
              )
            ]),
          ),
        );
      }),
    );

    var listStoriesWidget = ListView.separated(
      itemCount: 20,
      itemBuilder: ((BuildContext context, int index) {
        var storyImageUrl = dummyImageUrl + "people?random=${index * index}";

        var listTileItem = ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => UserStories(
                          storyImageUrl: storyImageUrl,
                        )));
          },
          leading: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => OtherUserProfile()));
            },
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                dummyImageUrl + "model,black,1",
              ),
            ),
          ),
          title: Text("Lucy Matt",
              style: Theme.of(context)
                  .textTheme
                  .subhead
                  .copyWith(fontWeight: FontWeight.bold)),
          subtitle:
              Text("@lucymat0", style: Theme.of(context).textTheme.caption),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(MdiIcons.eyeOutline),
              SizedBox(width: 4.0),
              Text("2.9k", style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        );
        //The divider is added to the first item to show where tab bar stops
        return index == 0
            ? Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Divider(
                  color: Colors.grey,
                ),
                listTileItem
              ])
            : listTileItem;
      }),
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          color: Colors.grey,
        );
      },
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Theme.of(context).canvasColor,
          iconTheme: IconThemeData(color: Colors.black),
          actions: <Widget>[
            IconButton(
              icon: Icon(MdiIcons.dotsVertical),
              onPressed: () {},
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  // color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text("9876",
                                        style: Theme.of(context)
                                            .textTheme
                                            .title
                                            .copyWith(
                                                fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      height: 4.0,
                                    ),
                                    Text("Following",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle
                                            .copyWith(
                                                fontWeight: FontWeight.w300)),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                      child: Center(
                                          child: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                          dummyImageUrl + "bella",
                                        ),
                                        backgroundColor: Colors.transparent,
                                        radius: 30,
                                      )),
                                    ),
                                    SizedBox(
                                      height: 8.0,
                                    ),
                                    Text("Lucy Matt",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subhead
                                            .copyWith(
                                                fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      height: 2.0,
                                    ),
                                    Text("@lucymat0",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle
                                            .copyWith(
                                                fontWeight: FontWeight.w300)),
                                    SizedBox(
                                      height: 8.0,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text("6567",
                                        style: Theme.of(context)
                                            .textTheme
                                            .title
                                            .copyWith(
                                                fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      height: 4.0,
                                    ),
                                    Text("Followers",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle
                                            .copyWith(
                                                fontWeight: FontWeight.w300)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          OutlineButton(
                            color: Theme.of(context).primaryColor,
                            child: Text("Message"),
                            onPressed: () {},
                          ),
                          FlatButton(
                            textColor: Colors.white,
                            color: Theme.of(context).primaryColor,
                            child: Text("Follow"),
                            onPressed: () {},
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                TabBar(
                  isScrollable: true,
                  controller: tabController,
                  labelColor: Theme.of(context).primaryColor,
                  unselectedLabelColor: Theme.of(context).textTheme.body1.color,
                  indicatorColor: Theme.of(context).primaryColor,
                  tabs: <Widget>[
                    Tab(
                      text: "Stories",
                    ),
                    Tab(
                      text: "Post",
                    )
                  ],
                ),
                Expanded(
                    child: TabBarView(
                        controller: tabController,
                        children: <Widget>[
                      ProfileStories(
                          tabController: tabControllerStories,
                          gridStoriesWidget: gridStoriesWidget,
                          listStoriesWidget: listStoriesWidget),
                      ProfilePost(dummyImageUrl: dummyImageUrl),
                    ])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfilePost extends StatelessWidget {
  const ProfilePost({
    Key key,
    @required this.dummyImageUrl,
  }) : super(key: key);

  final String dummyImageUrl;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, childAspectRatio: 1 / 1),
      itemCount: 20,
      scrollDirection: Axis.vertical,
      itemBuilder: ((BuildContext context, int index) {
        final String storyImageUrl =
            dummyImageUrl + "girl, cute?random=${index * index}";
        return Card(
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => ImageDetails(
                            storyImageUrl: storyImageUrl,
                          )));
            },
            child: Column(
              children: <Widget>[
                ListTile(
                    onTap: () {},
                    leading: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => OtherUserProfile()));
                      },
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          dummyImageUrl + "model,black,1",
                        ),
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
                  // child:
                  // Hero(
                  // tag: storyImageUrl,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(storyImageUrl))),
                  ),
                  // ),
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
          ),
        );
      }),
    );
  }
}

class ProfileStories extends StatelessWidget {
  const ProfileStories({
    Key key,
    @required this.tabController,
    @required this.gridStoriesWidget,
    @required this.listStoriesWidget,
  }) : super(key: key);

  final TabController tabController;
  final GridView gridStoriesWidget;
  final ListView listStoriesWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TabBar(
          indicatorColor: Colors.transparent,
          unselectedLabelColor: Theme.of(context).textTheme.body1.color,
          labelColor: Theme.of(context).primaryColor,
          controller: tabController,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.grid_on)),
            Tab(icon: Icon(Icons.list)),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: <Widget>[
              gridStoriesWidget,
              listStoriesWidget,
            ],
          ),
        ),
      ],
    );
  }
}
