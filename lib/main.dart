import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() => runApp(CarouselDemo());

final Widget placeholder = Container(color: Colors.grey);

final List<String> imgList = [
  'images/bus.jpg',
  'images/bus-dog.jpg',
  'images/dog.jpg'
];

final List child = map<Widget>(
  imgList,
      (index, i) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(children: <Widget>[
          Image.asset(i, fit: BoxFit.cover, width: 1000.0),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromARGB(200, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                'No. $index image',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  },
).toList();

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

class CarouselWithIndicator extends StatefulWidget {
  @override
  _CarouselWithIndicatorState createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselSlider(
        items: child,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 2.0,
        onPageChanged: (index) {
          setState(() {
            _current = index;
          });
        },
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: map<Widget>(
          imgList,
              (index, url) {
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                      ? Color.fromRGBO(0, 0, 0, 0.9)
                      : Color.fromRGBO(0, 0, 0, 0.4)),
            );
          },
        ),
      ),
    ]);
  }
}

class CarouselDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //Pages covers entire carousel
    final CarouselSlider coverScreenExample = CarouselSlider(
      viewportFraction: 1.0,
      aspectRatio: 2.0,
      autoPlay: false,
      enlargeCenterPage: false,
      items: map<Widget>(
        imgList,
            (index, i) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(i), fit: BoxFit.cover),
            ),
          );
        },
      ),
    );

    return MaterialApp(
      title: 'demo',
      home: Scaffold(
        appBar: AppBar(title: Text('Изучаем слова')),
        body: ListView(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.symmetric(vertical: 1.0),
                child: Column(children: [
                  coverScreenExample,
                ])),
          ],
        ),
      ),
    );
  }
}