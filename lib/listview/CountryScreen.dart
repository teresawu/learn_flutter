import 'package:flutter/material.dart';
import 'package:learn/listview/CountryWidget.dart';

class CountryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("CountryScreen called - 7");
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CountryWidget(),
    );
  }
}
