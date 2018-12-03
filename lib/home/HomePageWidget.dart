import 'package:flutter/material.dart';
import 'package:flutter_app/home/HomePageView.dart';
import 'package:flutter_app/util/Keys.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class HomePageWidget extends StatefulWidget {
  final String title;
  final WebSocketChannel channel;

  HomePageWidget({Key key, @required this.title, @required this.channel})
      : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePageWidget> {
  TextEditingController controller = TextEditingController();
  final List<String> list = [];

  @override
  void initState() {
    super.initState();
    widget.channel.stream.listen((data) => setState(() => list.add(data)));
  }

  void sendData() {
    if (controller.text.isNotEmpty) {
      widget.channel.sink.add(controller.text);
      controller.text = "";
    }
  }

  @override
  void dispose() {
    widget.channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Form(
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: Keys.SEND_WEBSOCKET,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: list.map((data) => Text(data)).toList(),
            ),
            ratingRow(),
            iconlist(),
            imageColumn()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.send),
        onPressed: sendData,
        tooltip: Keys.SEND_MSG,
      ),
    );
  }
}
