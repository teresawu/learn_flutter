import 'package:flutter/material.dart';
import 'package:sample/listview/CountryPageWidget.dart';

class CountryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CountryPageWidget(),
    );
  }
}
