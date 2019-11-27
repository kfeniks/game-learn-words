import 'package:flutter/material.dart';
import 'play.dart';

void main() => runApp(
    MaterialApp(
      home: MyApp(),
    )
);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Stack(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/image-bg.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: null /* add child content here */,
          ),
          Container(
            alignment: Alignment.bottomCenter,
            transform: Matrix4.translationValues(0.0, -50.0, 0.0),
            child:
              RaisedButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.green)
                ),
                child: Text(
                    "поехали",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20.0
                  ),
                ),
                color: Colors.green,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CarouselDemo(),
                    ),
                  );
                },
            )
          ),
          Container(
              alignment: Alignment.topCenter,
              transform: Matrix4.translationValues(0.0, 50.0, 0.0),
              child:
              new Text(
                  'SWIP',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 60.0
                ),
              )
          ),
          Container(
              alignment: Alignment.topCenter,
              transform: Matrix4.translationValues(0.0, 125.0, 0.0),
              child:
              new Text(
                  'скорочтение для детей',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 30.0
                ),
              )
          ),
        ],
      )
    );
  }
}