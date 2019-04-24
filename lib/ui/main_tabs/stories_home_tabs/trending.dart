import 'package:flutter/material.dart';

class Trending extends StatefulWidget {
  const Trending({
    Key key,
  }) : super(key: key);

  @override
  _TrendingState createState() => _TrendingState();
}

class _TrendingState extends State<Trending>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var gridTrendingWidget = GridView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 20,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 2 / 3),
      itemBuilder: ((BuildContext context, int index) {
        return Card(
          child: Stack(alignment: Alignment(0.0, 0.9), children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  //The gradient is added so the white text can be seen against images with white/bright backgrounds
                  gradient: LinearGradient(
                      begin: Alignment(0.0, 1.0),
                      end: Alignment(0.0, 0.4),
                      colors: [
                    Colors.black38,
                    Colors.transparent,
                  ])),
              child: Center(
                child: Text("Image"),
              ),
            ),
            Positioned(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.remove_red_eye,
                        color: Colors.white,
                      ),
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
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1.0,
              color: Theme.of(context).primaryColor,
            ),
            borderRadius: BorderRadius.circular(4.0),
          ),
        );
      }),
    );

    var listTrendingWidget = ListView.separated(
      itemCount: 20,
      itemBuilder: ((BuildContext context, int index) {
        return ListTile(
          onTap: () {},
          leading: CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(
              Icons.person,
              color: Colors.black,
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
              Icon(Icons.remove_red_eye),
              SizedBox(width: 4.0),
              Text("2.9k", style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        );
      }),
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          color: Colors.grey,
        );
      },
    );

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
              gridTrendingWidget,
              listTrendingWidget,
            ],
          ),
        ),
      ],
    );
  }
}
