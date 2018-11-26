import 'package:flutter/material.dart';

Widget getExpandedImage(String imagePath) {
  return Expanded(
    child: Container(
      decoration: BoxDecoration(
          border: Border.all(width: 5.0, color: Colors.black26),
          borderRadius: const BorderRadius.all(const Radius.circular(8.0))),
      margin: const EdgeInsets.all(4.0),
      child: Image.asset(imagePath, fit: BoxFit.fill),
    ),
  );
}

Widget imageColumn() {
  return Container(
    decoration: BoxDecoration(color: Colors.black12),
    padding: EdgeInsets.all(4.0),
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            getExpandedImage('image/1.jpg'),
            getExpandedImage('image/2.jpg')
          ],
        ),
        Row(
          children: <Widget>[
            getExpandedImage('image/3.jpg'),
            getExpandedImage('image/4.jpg')
          ],
        )
      ],
    ),
  );
}

Widget ratingRow() {
  return Container(
    margin: EdgeInsets.only(top: 100.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(Icons.star, color: Colors.green[500]),
            Icon(Icons.star, color: Colors.pink[500]),
            Icon(Icons.star, color: Colors.black),
            Icon(Icons.star, color: Colors.black),
            Icon(Icons.star, color: Colors.black),
          ],
        ),
        Text('170 Reviews')
      ],
    ),
  );
}

Widget iconlist() {
  return DefaultTextStyle.merge(
    style: _descTextStyle,
    child: Container(
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              Icon(Icons.kitchen, color: Colors.black),
              Text('PREP:'),
              Text('25 min'),
            ],
          ),
          Column(
            children: <Widget>[
              Icon(Icons.timer, color: Colors.black),
              Text('COOK:'),
              Text('1 hr'),
            ],
          ),
          Column(
            children: <Widget>[
              Icon(Icons.restaurant, color: Colors.black),
              Text('FEEDS:'),
              Text('4-6'),
            ],
          ),
        ],
      ),
    ),
  );
}

final _descTextStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w800,
  fontFamily: 'Roboto',
  letterSpacing: 0.5,
  fontSize: 18.0,
  height: 2.0,
);
