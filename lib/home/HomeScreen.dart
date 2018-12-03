import 'package:flutter/material.dart';
import 'package:flutter_app/home/HomePageWidget.dart';
import 'package:flutter_app/util/Keys.dart';
import 'package:web_socket_channel/io.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePageWidget(
          title: Keys.HOME,
          channel: IOWebSocketChannel.connect(Keys.WEBSOCKET_LINK)),
    );
  }
}
