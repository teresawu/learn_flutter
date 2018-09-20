import 'package:flutter/material.dart';
import 'package:sample/CountryState.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup',
      home: CountryApp(),
    );
  }
}



