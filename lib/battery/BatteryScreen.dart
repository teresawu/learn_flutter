import 'package:flutter/material.dart';
import 'package:sample/battery/BatteryWidget.dart';

class BatteryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BatteryWidget(),
    );
  }
}
