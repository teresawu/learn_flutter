import 'dart:convert';
import 'package:flutter/material.dart';

class CountryState extends State<CountryApp> {
  List data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Country List"),
        ),
        body: new Container(
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
                    // Build the ListView
                    itemBuilder: (BuildContext context, int index) {
                      return new Card(
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            new Text("Name: " + new_data[index]['name']),
                            new Text("Code: " + new_data[index]['code'])
                          ],
                        ),
                      );
                    },
                    itemCount: new_data == null ? 0 : new_data.length,
                  );
                }),
          ),
        ));
  }
}

class CountryApp extends StatefulWidget {
  @override
  CountryState createState() => new CountryState();
}
