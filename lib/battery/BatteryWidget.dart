import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BatteryWidget extends StatefulWidget {
  @override
  BatteryState createState() => BatteryState();
}

class BatteryState extends State<BatteryWidget> {
  static const MethodChannel methodChannel =
  MethodChannel('samples.flutter.io/battery');
  String _batteryLevel = 'Battery level: unknown.';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await methodChannel.invokeMethod('getBatteryLevel');
        batteryLevel = 'Battery level: $result%.';
    } on PlatformException {
      batteryLevel = 'Failed to get battery level.';
    }
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Battery")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_batteryLevel, key: const Key('Battery level label')),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: RaisedButton(
                    child: const Text('Refresh'),
                    onPressed: _getBatteryLevel,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}