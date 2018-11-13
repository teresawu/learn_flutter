import 'package:flutter/material.dart';

class Layout extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset('image/1.jpg'),
          Image.asset('image/2.jpg'),
          Image.asset('image/3.jpg')
        ],
      )),
    );
  }
}

class TestPage extends StatefulWidget {
  final String title;

  TestPage({Key key, @required this.title}) : super(key: key);

  @override
  Layout createState() => Layout();
}
