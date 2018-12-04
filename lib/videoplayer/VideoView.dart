import 'package:flutter/material.dart';

AppBar getVideoScreenAppBar() {
  return AppBar(
    title: Text('Video Player'),
    bottom: TabBar(
      isScrollable: true,
      tabs: <Widget>[
        Tab(icon: Icon(Icons.fullscreen)),
        Tab(icon: Icon(Icons.list)),
      ],
    ),
  );
}
