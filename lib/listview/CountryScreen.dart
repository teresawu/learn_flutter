import 'package:flutter/material.dart';
import 'package:sample/listview/CountryWidget.dart';

class CountryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CountryWidget(),
    );
  }
}
