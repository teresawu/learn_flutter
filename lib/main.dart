import 'package:flutter/material.dart';
import 'package:flutter_app/battery/BatteryScreen.dart';
import 'package:flutter_app/home/HomeScreen.dart';
import 'package:flutter_app/listview/CountryScreen.dart';

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
                _padding(context, "Home Screen", HomeScreen()),
                _padding(context, "List View", CountryScreen()),
                _padding(context, "Video Screen", CountryScreen()),
                _padding(context, "Battery", BatteryScreen(), platform: true)
              ],
            )),
      ),
    );
  }
}

IconData _icon(BuildContext context, bool displayPlatform) {
  if (displayPlatform) {
    if (Theme.of(context).platform == TargetPlatform.iOS)
      return Icons.battery_charging_full;
    else
      return Icons.android;
  } else
    return null;
}

Padding _padding(BuildContext context, String name, StatelessWidget screen,
    {@required bool platform = false}) {
  return Padding(
      padding: const EdgeInsets.all(14.0),
      child: MaterialButton(
        height: 60.0,
        minWidth: double.infinity,
        color: Theme.of(context).accentColor,
        elevation: 4.0,
        splashColor: Colors.blueGrey,
        textColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) => screen),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(name, style: TextStyle(fontSize: 18.0)),
            Icon(_icon(context, platform)),
          ],
        ),
      ));
}
