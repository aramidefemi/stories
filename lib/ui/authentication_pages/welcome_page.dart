import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:stories/ui/authentication_pages/new_user_page.dart';
import 'package:stories/ui/authentication_pages/sign_in_page.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 32.0, 0.0, 32.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                      text: "Welcome To",
                      style: Theme.of(context)
                          .textTheme
                          .headline
                          .copyWith(fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                          text: " CatchUP",
                          style: Theme.of(context).textTheme.display1.copyWith(
                              color: Theme.of(context).textTheme.body1.color,
                              fontFamily: "Scriptorama"),
                        ),
                      ]),
                ),
                Text(
                  "Best Story App",
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .copyWith(fontWeight: FontWeight.w400),
                ),
                Expanded(
                  child: SwipeOnboarding(),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36.0),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      color: Theme.of(context).primaryColor,
                      child: Text(
                        "Get Started",
                        style: Theme.of(context).textTheme.title.copyWith(
                              color: Colors.white,
                            ),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => NewUserPage()));
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Already Have An Account? ",
                      style: Theme.of(context)
                          .textTheme
                          .subhead
                          .copyWith(fontWeight: FontWeight.normal),
                    ),
                    InkWell(
                      child: Text(
                        "Sign In",
                        style: Theme.of(context).textTheme.subhead.copyWith(
                            fontWeight: FontWeight.normal,
                            color: Theme.of(context).primaryColor),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => SignInPage()));
                      },
                    ),
                  ],
                )

                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SwipeOnboarding extends StatefulWidget {
  const SwipeOnboarding({
    Key key,
  }) : super(key: key);

  @override
  _SwipeOnboardingState createState() => _SwipeOnboardingState();
}

class _SwipeOnboardingState extends State<SwipeOnboarding> {
  int _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPage = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: PageView(
              onPageChanged: (currentPage) {
                setState(() {
                  _currentPage = currentPage;
                });
              },
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: Image.asset(
                      "images/intro_image.png",
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: Image.asset(
                      "images/intro_image.png",
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: Image.asset(
                      "images/intro_image.png",
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: Image.asset(
                      "images/intro_image.png",
                    ),
                  ),
                ),
              ]),
        ),
        DotsIndicator(
          dotsCount: 4,
          position: _currentPage,
          decorator: DotsDecorator(
            size: const Size.square(16.0),
            activeSize: const Size.square(16.0),
            activeColor: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
