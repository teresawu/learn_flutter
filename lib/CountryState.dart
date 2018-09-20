import 'dart:convert';

import 'package:flutter/material.dart';

class CountryState extends State<CountryApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Country List"),
      ),
      body: _buildContainer(),
    );
  }

  Widget _buildContainer() {
    return new Container(
      child: new Center(
        // Use future builder and DefaultAssetBundle to load the local JSON file
        child: new FutureBuilder(
            future: DefaultAssetBundle
                .of(context)
                .loadString('data_repo/country.json'),
            builder: (context, snapshot) {
              // Decode the JSON
              var new_data = JSON.decode(snapshot.data.toString());
              return new ListView.builder(
                  padding: const EdgeInsets.all(14.0),
                  itemBuilder: (context, index) {
                    if (index.isOdd) return Divider();
                    return new ListTile(
                        title: Text(
                          new_data[index]['name'] +
                              " - " +
                              new_data[index]['code'],
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        trailing: new Icon(Icons.directions_bike));
                  });
            }),
      ),
    );
  }
}

class CountryApp extends StatefulWidget {
  @override
  CountryState createState() => new CountryState();
}
