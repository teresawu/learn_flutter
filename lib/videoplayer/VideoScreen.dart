import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/videoplayer/PlayerWidget.dart';
import 'package:flutter_app/videoplayer/VideoWidget.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Video Player")),
        body: Container(
          padding: const EdgeInsets.only(top: 20.0),
          child: PlayerWidget(
              'https://www.youtube.com/watch?v=fq4N0hgOWzU',
              (BuildContext context, VideoPlayerController controller) =>
                  AspectRatioVideo(controller)),
        ),
      ),
    );
  }
}
