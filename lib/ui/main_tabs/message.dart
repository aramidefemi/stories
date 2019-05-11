import 'package:stories/resources/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:stories/ui/profile_screens/other_user_profile.dart';
import 'package:stories/ui/profile_screens/profile.dart';

class Message extends StatelessWidget {
  var dummyImageUrl = DummyData.dummyImageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Message",
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
              padding: EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Profile()));
                },
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    dummyImageUrl + "bella",
                  ),
                ),
              ))
        ],
      ),
      body: ListView.separated(
        padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
        itemBuilder: ((BuildContext context, int index) {
          return ListTile(
            enabled: true,
            onTap: () {},
            leading: Container(
              child: Stack(alignment: Alignment.topRight, children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => OtherUserProfile()));
                  },
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      dummyImageUrl + "student?random=$index",
                    ),
                  ),
                ),
                (index == 0 || index == 2)
                    ? Positioned(
                        child: Container(
                          height: 16.0,
                          width: 16.0,
                          child: SizedBox.shrink(
                              child: Center(
                            child: Text(
                              (index * 3).toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal),
                            ),
                          )),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      )
                    : Container(
                        height: 0.0,
                        width: 0.0,
                      )
              ]),
            ),
            title: Text(
              "Lucy Matt",
              style: Theme.of(context).textTheme.subhead.copyWith(
                    color: (index == 0 || index == 2)
                        ? Theme.of(context).primaryColor
                        : null,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            subtitle: Text(
              "Yeah, that's cool. Let's say",
              style: Theme.of(context).textTheme.caption.copyWith(
                  // fontWeight: FontWeight.normal
                  ),
            ),
            trailing: Text(
              "5 mins ago",
              style: Theme.of(context).textTheme.overline,
            ),
          );
        }),
        itemCount: 10,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Colors.grey,
          );
        },
      ),
    );
  }
}
