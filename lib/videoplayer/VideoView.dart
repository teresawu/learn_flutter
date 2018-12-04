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

/// A filler card to show the video in a list of scrolling contents.
Widget buildCard(String title) {
  return Card(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.airline_seat_flat_angled),
          title: Text(title),
        ),
        ButtonTheme.bar(
          child: ButtonBar(
            children: <Widget>[
              FlatButton(
                child: const Text('BUY TICKETS'),
                onPressed: () {
                  /* ... */
                },
              ),
              FlatButton(
                child: const Text('SELL TICKETS'),
                onPressed: () {
                  /* ... */
                },
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
