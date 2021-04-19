import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui/widgets/adventures_carousel.dart';
import 'package:ui/widgets/circle_tab_indicator.dart';
import 'package:ui/widgets/destination_carousel.dart';
import 'package:ui/widgets/informations_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectTab = 0;
  bool clickedFAB = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainPage(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 20.0),
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              clickedFAB = !clickedFAB;
            });
          },
          tooltip: 'Location',
          elevation: 10.0,
          backgroundColor: Colors.white,
          child: Icon(
            FontAwesome.location_arrow,
            color: Theme.of(context).primaryColor,
            size: 22.0,
          ),
        ),
      ),
    );
  }

  mainPage() {
    return Stack(
      children: <Widget>[
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 10.0, top: 70.0, right: 25.0),
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SvgPicture.asset("assets/icons/menu.svg"),
                    InkWell(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image(
                          image: AssetImage("assets/images/theodore.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(25.0, 20.0, 15.0, 5.0),
                child: Text(
                  "Discover",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 30.0),
                child: DefaultTabController(
                  length: 3,
                  child: TabBar(
                    labelColor: Theme.of(context).primaryColor,
                    unselectedLabelColor: Theme.of(context).accentColor,
                    isScrollable: true,
                    indicator: CircleTabIndicator(
                        color: Theme.of(context).primaryColor, radius: 3.0),
                    tabs: <Widget>[
                      Tab(
                        child: Text(
                          "Experiences",
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Sights",
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Housings",
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              DestinationCarousel(),
              SizedBox(height: 30.0),
              Padding(
                padding: EdgeInsets.only(left: 25.0, right: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Feeling Adventurous?",
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Show all",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.0),
              AdventuresCarousel(),
              SizedBox(height: 20.0),
              InformationsCarousel(),
              SizedBox(height: 30.0),
            ],
          ),
        ),
        Align(
          alignment: FractionalOffset.bottomCenter,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 250),
            height: clickedFAB ? MediaQuery.of(context).size.height : 10.0,
            width: clickedFAB ? MediaQuery.of(context).size.width : 10.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(clickedFAB ? 0.0 : 300.0),
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        _bottomBar(),
      ],
    );
  }

  _updateTabSelection(int index) {
    setState(() {
      selectTab = index;
    });
  }

  _bottomBar() {
    return Positioned(
      bottom: 0.0,
      left: 0.0,
      right: 0.0,
      child: Container(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        height: 60.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.1),
              offset: Offset(0, -2),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ),
          ],
          color: Colors.white,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              onPressed: () {
                _updateTabSelection(0);
              },
              icon: Icon(
                Icons.home,
                color: selectTab == 0
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).accentColor,
              ),
            ),
            IconButton(
              onPressed: () {
                _updateTabSelection(1);
              },
              icon: Icon(
                Icons.notifications,
                color: selectTab == 1
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).accentColor,
              ),
            ),
            SizedBox(width: 50.0),
            IconButton(
              onPressed: () {
                _updateTabSelection(2);
              },
              icon: Icon(
                Icons.bookmark,
                color: selectTab == 2
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).accentColor,
              ),
            ),
            IconButton(
              onPressed: () {
                _updateTabSelection(3);
              },
              icon: Icon(
                Icons.person,
                color: selectTab == 3
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).accentColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}