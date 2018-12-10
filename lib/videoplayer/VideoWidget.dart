import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  final String videoURL;

  VideoWidget(this.videoURL) : super();

  @override
  VideoState createState() => VideoState();
}

class VideoState extends State<VideoWidget> {
  VideoPlayerController controller;
  VoidCallback listener;


  @override
  void initState() {
    super.initState();

    listener = () {
      setState(() {});
    };

    controller = VideoPlayerController.asset(widget.videoURL)
      ..addListener(listener)
      ..setVolume(1.0)
      ..initialize()
      ..play();
  }

  @override
  void deactivate() {
    controller.setVolume(0.0);
    controller.removeListener(listener);
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Video Player")),
      body: Center(
          child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                padding: EdgeInsets.all(4.0),
                child: (controller != null
                    ? VideoPlayer(
                        controller,
                      )
                    : Container()),
              ))),
      floatingActionButton: FloatingActionButton(
        onPressed:
            controller.value.isPlaying ? controller.pause : controller.play,
        child: Icon(
          controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
