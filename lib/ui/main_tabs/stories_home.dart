import 'package:stories/resources/dummy_data.dart';
import 'package:stories/ui/main_tabs/stories_home_screens/entertainment.dart';
import 'package:stories/ui/main_tabs/stories_home_screens/following.dart';
import 'package:stories/ui/main_tabs/stories_home_screens/news.dart';
import 'package:stories/ui/main_tabs/stories_home_screens/search.dart';
import 'package:stories/ui/main_tabs/stories_home_screens/trending.dart';
import 'package:stories/ui/main_tabs/stories_home_screens/upload_story.dart';
import 'package:flutter/material.dart';
import 'package:stories/ui/profile_screens/profile.dart';

class StoriesHome extends StatefulWidget {
  @override
  _StoriesHomeState createState() => _StoriesHomeState();
}

class _StoriesHomeState extends State<StoriesHome>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  var dummyImageUrl = DummyData.dummyImageUrl;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(vsync: this, length: 5, initialIndex: 1);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var locationIndicator = Container(
      constraints: BoxConstraints(
        minWidth: MediaQuery.of(context).size.width * 0.4,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          border: Border.all(color: Theme.of(context).primaryColor)),
      margin: EdgeInsets.only(left: 8.0, right: 16.0, top: 16.0, bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(
            Icons.remove_circle,
            color: Theme.of(context).primaryColor,
            size: 16.0,
          ),
          Center(
            child: Text(
              "Nigeria",
              style: Theme.of(context).textTheme.overline,
            ),
          ),
          Icon(
            Icons.arrow_drop_down_circle,
            color: Colors.black,
            size: 12.0,
          )
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Stories",
          style: Theme.of(context)
              .textTheme
              .title
              .copyWith(fontFamily: "Scriptorama"),
        ),
        backgroundColor: Theme.of(context).canvasColor,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          locationIndicator,
          Container(
            margin: EdgeInsets.only(right: 16.0),
            padding: EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => Profile()));},
                          child: CircleAvatar(
                backgroundImage: NetworkImage(
                  dummyImageUrl + "cars",
                ),
              ),
            ),
          )
        ],
        bottom: TabBar(
          isScrollable: true,
          controller: tabController,
          labelColor: Theme.of(context).primaryColor,
          unselectedLabelColor: Theme.of(context).textTheme.body1.color,
          indicatorColor: Theme.of(context).primaryColor,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.search)),
            Tab(text: "Trending"),
            Tab(text: "Following"),
            Tab(text: "News"),
            Tab(text: "Entertainment"),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: <Widget>[
          Search(),
          Trending(),
          Following(),
          News(),
          Entertainment(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => UploadStory()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
