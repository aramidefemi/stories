import 'package:Stories/ui/main_tabs/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Entertainment extends StatefulWidget {
  const Entertainment({
    Key key,
  }) : super(key: key);

  @override
  _EntertainmentState createState() => _EntertainmentState();
}

class _EntertainmentState extends State<Entertainment>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  var dummyImageUrl = DummyData.dummyImageUrl;

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
          crossAxisCount: 2, childAspectRatio: 2 /3),
      itemBuilder: ((BuildContext context, int index) {
        return Card(
          clipBehavior: Clip.antiAlias,

          child: Stack(alignment: Alignment(0.0, 0.9), children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        dummyImageUrl + "girl?random=${index*index}",
                      )),
                  //The gradient is added so the white text can be seen against images with white/bright backgrounds
                  gradient: LinearGradient(
                      begin: Alignment(0.0, 1.0),
                      end: Alignment(0.0, 0.4),
                      colors: [
                        Colors.black54,
                        Colors.transparent,
                      ])),
            ),
            Positioned(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      dummyImageUrl + "ladies?random=${index*index}",
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
            
          ),
        );
      }),
    );

    var listTrendingWidget = ListView.separated(
      itemCount: 20,
      itemBuilder: ((BuildContext context, int index) {
        var listTileItem = ListTile(
          onTap: () {},
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
              dummyImageUrl + "model,black,1",
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
