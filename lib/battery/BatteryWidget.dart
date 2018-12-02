import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learn/util/Keys.dart';

class BatteryWidget extends StatefulWidget {
  @override
  BatteryState createState() => new BatteryState();
}

class BatteryState extends State<BatteryWidget> {
  static const platform = const MethodChannel('samples.flutter.io/battery');
  String _batteryLevel = Keys.BATTERY_UNKNOWN;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RaisedButton(
              child: Text(Keys.GET_BATTERY_LEVEL),
              onPressed: _getBatteryLevel,
            ),
            Text(_batteryLevel)
          ],
        ),
      ),
    );
  }

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }
}
