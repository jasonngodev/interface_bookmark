import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class InformationsCarousel extends StatefulWidget {
  @override
  _InformationsCarouselState createState() => _InformationsCarouselState();
}

class _InformationsCarouselState extends State<InformationsCarousel> {
  int _current = 0;

  final List<String> _imgList = [
    "assets/images/travel_p.jpg",
    "assets/images/documents.jpg",
    "assets/images/Travel-tips-Hong-Kong.jpg"
  ];

  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = _imgList
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.only(right: 15.0),
                child: Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(
                        item,
                        fit: BoxFit.cover,
                        width: 1000.0,
                      ),
                    ),
                    Positioned(
                      top: 20.0,
                      right: 15.0,
                      child: Container(
                        alignment: Alignment.center,
                        width: 120.0,
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 9.0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Text(
                          "Preparation",
                          style: TextStyle(
                            fontSize: 13.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ))
        .toList();

    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Useful Informations",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: _imgList.map((img) {
                    int index = _imgList.indexOf(img);
                    return Container(
                      height: 8.0,
                      width: _current == index ? 23.0 : 8.0,
                      margin:
                          EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                      decoration: BoxDecoration(
                        color: _current == index
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).primaryColor.withOpacity(0.4),
                        shape: _current == index
                            ? BoxShape.rectangle
                            : BoxShape.circle,
                        borderRadius: _current == index
                            ? BorderRadius.circular(20.0)
                            : null,
                      ),
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 30.0),
        CarouselSlider(
          items: imageSliders,
          options: CarouselOptions(
              aspectRatio: 2.0,
              enlargeCenterPage: false,
              scrollPhysics: BouncingScrollPhysics(),
              carouselController: _controller,
              enableInfiniteScroll: false,
              viewportFraction: 0.9,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        SizedBox(height: 30.0),
      ],
    );
  }
}