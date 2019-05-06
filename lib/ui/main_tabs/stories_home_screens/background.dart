import 'package:stories/resources/dummy_data.dart';
import 'package:stories/ui/main_tabs/stories_home.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final List dummyCategoryList = DummyData.dummyCategoryList;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;
    double screenWidth = screenSize.width;
    double screenAspectRatio = screenHeight / screenWidth;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        automaticallyImplyLeading: true,
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          "Choose Background",
          style: Theme.of(context)
              .textTheme
              .title
              .copyWith(fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text("Select"),
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => StoriesHome()));
            },
            textColor: Theme.of(context).primaryColor,
          )
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 0.0),
        itemCount: dummyCategoryList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                  ),
                  child: Text(
                    dummyCategoryList.elementAt(index),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  height: screenHeight * 0.3,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: dummyCategoryList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: screenAspectRatio,
                        mainAxisSpacing: 2.0,
                        crossAxisCount: 1),
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Container(color: Theme.of(context).primaryColor),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
