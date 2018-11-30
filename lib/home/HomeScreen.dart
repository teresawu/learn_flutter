import 'package:flutter/material.dart';
import 'package:sample/home/HomePageWidget.dart';
import 'package:web_socket_channel/io.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePageWidget(
          title: "Home",
          channel: IOWebSocketChannel.connect('ws://echo.websocket.org')),
    );
  }
}
