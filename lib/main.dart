import 'package:flutter/material.dart';
import 'package:sample/home/HomeScreen.dart';
import 'package:sample/listview/CountryScreen.dart';

void main() => runApp(MainPage());

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter'),
        ),
        body: Center(
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: button(context, "Home Screen", HomeScreen())),
                  Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: button(context, "List View", CountryScreen())),
                ],
              )),
        ),
      ),
    );
  }
}

MaterialButton button(BuildContext context, String name, StatelessWidget screen) {
  return MaterialButton(
    height: 60.0,
    minWidth: double.infinity,
    color: Theme.of(context).accentColor,
    elevation: 4.0,
    splashColor: Colors.blueGrey,
    textColor: Colors.white,
    child: Text(name),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => screen),
      );
    },
  );
}
