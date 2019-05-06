import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stories/resources/dummy_data.dart';

class ImageDetails extends StatelessWidget {
  final storyImageUrl;

  ImageDetails({Key key, @required this.storyImageUrl}) : super(key: key);
  var dummyImageUrl = DummyData.dummyImageUrl;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
          body: SizedBox(
        height: screenHeight,
        child: Column(
          children: <Widget>[
            Expanded(
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    flexibleSpace: FlexibleSpaceBar(
                      background: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[Colors.black12, Colors.black12],
                              stops: [0.1, 0.5],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            image: DecorationImage(
                              image: NetworkImage(
                                storyImageUrl,
                              ),
                            )),
                      ),
                    ),
                    backgroundColor: Colors.transparent,
                    expandedHeight: screenHeight / 2,
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      SizedBox(
                        height: (screenHeight / 2),
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
                                style: Theme.of(context)
                                    .textTheme
                                    .subhead
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              subtitle: Text("@lucymat0",
                                  style: Theme.of(context).textTheme.caption),
                              trailing: Text("Today 10:00am",
                                  style: Theme.of(context).textTheme.caption),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(top: 8.0),
                                decoration: BoxDecoration(
                                  border: Border.all(width: 0.1),
                                  borderRadius: BorderRadius.circular(32.0),

                                  // color: Colors.blue
                                ),
                                child: ListView(
                                    children: List.generate(5, (index) {
                                  return ListTile(
                                      contentPadding: EdgeInsets.only(
                                          top: 8.0, left: 16.0, right: 16.0),
                                      onTap: () {},
                                      leading: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                          dummyImageUrl + "model,black,1",
                                        ),
                                      ),
                                      title: RichText(
                                        text: TextSpan(
                                            text: "Lucy Matt",
                                            style: Theme.of(context)
                                                .textTheme
                                                .subhead
                                                .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: "       Today 10:00am",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption),
                                            ]),
                                      ),
                                      subtitle: Text(
                                        "Lorem ipsum dolor sit amet, consectetur  incididunt ut labore et dolore magna aliqua. ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption
                                            .copyWith(
                                                fontWeight: FontWeight.w400),
                                      ),
                                      trailing: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          MdiIcons.heartOutline,
                                          color: index == 1
                                              ? Theme.of(context).primaryColor
                                              : null,
                                        ),
                                      ));
                                }).toList()),
                              ),
                            )
                          ],
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  dummyImageUrl + "model,black,1",
                ),
              ),
              title: SizedBox(
                width: double.infinity,
                child: TextField(
                  decoration: InputDecoration.collapsed(
                      hintText: "Write your comment",
                      hintStyle: Theme.of(context).textTheme.caption),
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.send,
                ),
              ),
            )
          ],
        ),
      )

          // Material(
          //   child: Stack(children: <Widget>[
          //     Container(
          //       height: double.infinity,
          //       width: double.infinity,
          //       child: Column(
          //         children: <Widget>[
          //           Expanded(
          //             child: Container(
          //               color: Colors.blue,
          //             ),
          //           ),
          //           Expanded(
          //             child: Container(
          //               color: Colors.red,
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //     Positioned(
          //       top: 0.0,
          //       left: 0.0,
          //       right: 0.0,
          //       child: AppBar(
          //         elevation: 0.0,
          //         backgroundColor: Colors.transparent,
          //       ),
          //     )
          //   ]),
          // ),
          ),
    );
  }
}
