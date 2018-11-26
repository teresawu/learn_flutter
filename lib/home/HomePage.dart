import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:sample/home/HomePageState.dart';

class HomePage extends StatefulWidget {
  final String title;
  final WebSocketChannel channel;

  HomePage({Key key, @required this.title, @required this.channel})
      : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}