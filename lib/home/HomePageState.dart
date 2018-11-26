import 'package:flutter/material.dart';
import 'package:sample/home/HomePage.dart';
import 'package:sample/home/HomePageWidget.dart';

class HomePageState extends State<HomePage> {
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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Form(
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: "Send to WebSocket",
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
        tooltip: 'Send message',
      ),
    );
  }
}
