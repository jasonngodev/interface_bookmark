import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:ui/models/activity_model.dart';
import 'package:ui/screens/home_screen.dart';
import 'package:ui/widgets/circle_tab_indicator.dart';

class ActivityScreen extends StatefulWidget {
  final Activity activity;

  const ActivityScreen({this.activity});

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 80.0,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          child: RaisedButton(
            onPressed: () {},
            textColor: Colors.white,
            color: Theme.of(context).primaryColor,
            child: Text("Book now"),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 700.0,
                        child: ClipRRect(
                          child: Image(
                            image: AssetImage(widget.activity.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 50.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                              color: Colors.white,
                              icon: Icon(Icons.arrow_back_ios),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => HomeScreen()),
                                );
                              },
                            ),
                            IconButton(
                              color: Colors.white,
                              icon: Icon(Icons.more_vert),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 400.0,
                        child: Container(
                          height: 500.0,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            gradient: LinearGradient(
                              begin: FractionalOffset.bottomCenter,
                              end: FractionalOffset.topCenter,
                              colors: [
                                Colors.black.withOpacity(0.8),
                                Colors.black87.withOpacity(0.7),
                                Colors.black54.withOpacity(0.6),
                                Colors.black38.withOpacity(0.1),
                              ],
                              stops: [0.2, 0.4, 0.6, 0.9],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 400.0,
                        left: 15.0,
                        right: 15.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Flexible(
                              child: Text(
                                widget.activity.name,
                                style: TextStyle(
                                  fontSize: 35.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.2,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                            ),
                            SizedBox(width: 20.0),
                            Column(
                              children: <Widget>[
                                Text(
                                  "⭐ ${widget.activity.rating}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  "${widget.activity.reviews} reviews",
                                  style: TextStyle(
                                    color: Colors.grey[200],
                                    fontSize: 15.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 590.0),
                        padding: EdgeInsets.only(top: 30.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30.0),
                            topLeft: Radius.circular(30.0),
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 5.0, right: 180.0),
                              child: DefaultTabController(
                                length: 2,
                                child: TabBar(
                                  labelColor: Theme.of(context).primaryColor,
                                  unselectedLabelColor:
                                      Theme.of(context).accentColor,
                                  isScrollable: true,
                                  indicator: CircleTabIndicator(
                                      color: Theme.of(context).primaryColor,
                                      radius: 3.0),
                                  tabs: <Widget>[
                                    Tab(
                                      child: Text(
                                        "Overview",
                                        style: TextStyle(fontSize: 18.0),
                                      ),
                                    ),
                                    Tab(
                                      child: Text(
                                        "Reviews",
                                        style: TextStyle(fontSize: 18.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Padding(
                              padding: EdgeInsets.only(left: 25.0, right: 25.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        AntDesign.tago,
                                        size: 40.0,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      SizedBox(width: 10.0),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "PRICE",
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              color:
                                                  Theme.of(context).accentColor,
                                            ),
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Text(
                                                "from",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                " \$${widget.activity.price}",
                                                style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        AntDesign.clockcircleo,
                                        size: 40.0,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      SizedBox(width: 10.0),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "DURATION",
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              color:
                                                  Theme.of(context).accentColor,
                                            ),
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Text(
                                                "${widget.activity.duration}",
                                                style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                " hours",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, bottom: 30.0),
                              child: Text(
                                widget.activity.description,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 550.0,
                        right: 25.0,
                        child: Container(
                          height: 90.0,
                          width: 90.0,
                          child: FloatingActionButton(
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.bookmark,
                              size: 40.0,
                              color: widget.activity.isMarked
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey[300],
                            ),
                            onPressed: () {
                              setState(() {
                                widget.activity.isMarked =
                                    !widget.activity.isMarked;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}