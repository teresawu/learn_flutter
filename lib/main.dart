import 'package:flutter/material.dart';
import 'package:sample/HomePage.dart';
import 'package:web_socket_channel/io.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(
        title: 'Websocket App',
        channel: IOWebSocketChannel.connect('ws://echo.websocket.org'),
      ),
    );
  }
}
