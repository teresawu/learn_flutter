import 'package:flutter/material.dart';
import 'package:sample/home/HomeScreen.dart';
import 'package:sample/listview/CountryScreen.dart';
import 'package:sample/battery/BatteryScreen.dart';
import 'package:sample/util/Keys.dart';

void main() => runApp(MainPage());

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue), home: MainScreen());
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter'),
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                _padding(context, Keys.HOME_SCREEN, HomeScreen()),
                _padding(context, Keys.LIST_VIEW, CountryScreen()),
                _padding(context, Keys.GET_BATTERY_LEVEL, BatteryScreen()),
                _padding(context, Keys.VIDEO_SCREEN, CountryScreen())
              ],
            )),
      ),
    );
  }
}

Padding _padding(BuildContext context, String name, StatelessWidget screen) {
  return Padding(
      padding: const EdgeInsets.all(14.0),
      child: MaterialButton(
        height: 60.0,
        minWidth: double.infinity,
        color: Theme.of(context).accentColor,
        elevation: 4.0,
        splashColor: Colors.blueGrey,
        textColor: Colors.white,
        child: Text(name, style: TextStyle(fontSize: 20.0)),
        onPressed: () {
          Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) => screen),
          );
        },
      ));
}
