import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(vsync: this, length: 4);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifications",
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
          ),
        ],
        bottom: TabBar(
          controller: tabController,
          labelColor: Theme.of(context).primaryColor,
          unselectedLabelColor: Theme.of(context).textTheme.body1.color,
          indicatorColor: Theme.of(context).primaryColor,
          tabs: <Widget>[
            Tab(text: "All"),
            Tab(text: "Loves"),
            Tab(text: "Comments"),
            Tab(text: "Repost"),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: <Widget>[
          AllNotifications(),
          LovesNotifications(),
          CommentsNotifications(),
          RepostNotifications()
        ],
      ),
    );
  }
}

class RepostNotifications extends StatelessWidget {
  const RepostNotifications({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
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
          title: RichText(
            text: TextSpan(
                text: "Lucy Matt",
                style: Theme.of(context).textTheme.subhead.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                children: <TextSpan>[
                  TextSpan(
                      text: " Reposted",
                      style: TextStyle(color: Theme.of(context).primaryColor)),
                  TextSpan(text: " your story")
                ]),
          ),
          subtitle: Text(
            "Today 10:00am",
            style: Theme.of(context).textTheme.caption.copyWith(
                // fontWeight: FontWeight.normal
                ),
          ),
          trailing: Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.grey,
              child: Icon(Icons.person)),
        );
      }),
      itemCount: 10,
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          color: Colors.grey,
        );
      },
    );
  }
}

class CommentsNotifications extends StatelessWidget {
  const CommentsNotifications({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
      itemBuilder: ((BuildContext context, int index) {
        return ListTile(
          enabled: true,
          onTap: () {},
          leading: CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(
              Icons.person,
              color: Colors.black,
            ),
          ),
          title: RichText(
            text: TextSpan(
                text: "Lucy Matt",
                style: Theme.of(context).textTheme.subhead.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                children: <TextSpan>[
                  TextSpan(
                      text: " Commented",
                      style: TextStyle(color: Theme.of(context).primaryColor)),
                  TextSpan(text: " your story")
                ]),
          ),
          subtitle: Text(
            "Today 10:00am",
            style: Theme.of(context).textTheme.caption.copyWith(
                // fontWeight: FontWeight.normal
                ),
          ),
          trailing: Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.grey,
              child: Icon(Icons.person)),
        );
      }),
      itemCount: 10,
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          color: Colors.grey,
        );
      },
    );
  }
}

class LovesNotifications extends StatelessWidget {
  const LovesNotifications({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
      itemBuilder: ((BuildContext context, int index) {
        return ListTile(
          enabled: true,
          onTap: () {},
          leading: CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(
              Icons.person,
              color: Colors.black,
            ),
          ),
          title: RichText(
            text: TextSpan(
                text: "Lucy Matt",
                style: Theme.of(context).textTheme.subhead.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                children: <TextSpan>[
                  TextSpan(
                      text: " Loved",
                      style: TextStyle(color: Theme.of(context).primaryColor)),
                  TextSpan(text: " your story")
                ]),
          ),
          subtitle: Text(
            "Today 10:00am",
            style: Theme.of(context).textTheme.caption.copyWith(
                // fontWeight: FontWeight.normal
                ),
          ),
          trailing: Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.grey,
              child: Icon(Icons.person)),
        );
      }),
      itemCount: 10,
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          color: Colors.grey,
        );
      },
    );
  }
}

class AllNotifications extends StatelessWidget {
  const AllNotifications({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
      itemBuilder: ((BuildContext context, int index) {
        return ListTile(
          enabled: true,
          onTap: () {},
          leading: CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(
              Icons.person,
              color: Colors.black,
            ),
          ),
          title: RichText(
            text: TextSpan(
                text: "Lucy Matt",
                style: Theme.of(context).textTheme.subhead.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                children: <TextSpan>[
                  TextSpan(
                      text: index == 0
                          ? " Commented"
                          : index == 5 ? " Reposted" : " Loved",
                      style: TextStyle(color: Theme.of(context).primaryColor)),
                  TextSpan(text: " your story")
                ]),
          ),
          subtitle: Text(
            "Today 10:00am",
            style: Theme.of(context).textTheme.caption.copyWith(
                // fontWeight: FontWeight.normal
                ),
          ),
          trailing: Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.grey,
              child: Icon(Icons.person)),
        );
      }),
      itemCount: 10,
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          color: Colors.grey,
        );
      },
    );
  }
}
