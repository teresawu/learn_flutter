import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class HomePage extends StatefulWidget {
  final String title;
  final WebSocketChannel channel;

  HomePage({Key key, @required this.title, @required this.channel})
      : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

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

//             StreamBuilder(
//               stream: widget.channel.stream,
//               builder: (context, snapshot) {
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 24.0),
//                   child: Text(snapshot.hasData ? '${snapshot.data}' : ''),
//                 );
//               },
//             ),
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
