import 'package:flutter/material.dart';

class Message extends StatelessWidget {
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
      body: ListView.separated(
        itemBuilder: ((BuildContext context, int index) {
          return ListTile(
            leading: Container(
              child: Stack(alignment: Alignment.topRight, children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.black,
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
              "Jon Doe",
              style: Theme.of(context).textTheme.subhead.copyWith(
                    color: (index == 0 || index == 2)
                        ? Theme.of(context).primaryColor
                        : null,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            subtitle: Text(
              "Okay, wait, what have you been eating? 😂\nDon't tell me it's noodles again 🍜",
              style: Theme.of(context).textTheme.caption,
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
