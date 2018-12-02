import 'package:flutter/material.dart';
import 'package:learn/home/HomeViewModel.dart';
import 'package:learn/util/Keys.dart';
import 'package:web_socket_channel/io.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeViewModel(
          title: Keys.HOME,
          channel: IOWebSocketChannel.connect(Keys.WEBSOCKET_LINK)),
    );
  }
}
