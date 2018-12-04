import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/videoplayer/VideoView.dart';
import 'package:flutter_app/videoplayer/VideoWidget.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: getVideoScreenAppBar(),
          body: TabBarView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  NetworkPlayerLifeCycle(
                      'http://www.sample-videos.com/video/mp4/720/big_buck_bunny_720p_20mb.mp4',
                      (BuildContext context,
                              VideoPlayerController controller) =>
                          AspectRatioVideo(controller)),
                  Container(padding: const EdgeInsets.only(top: 20.0)),
                  NetworkPlayerLifeCycle(
                    'http://184.72.239.149/vod/smil:BigBuckBunny.smil/playlist.m3u8',
                    (BuildContext context, VideoPlayerController controller) =>
                        AspectRatioVideo(controller),
                  ),
                ],
              ),
              NetworkPlayerLifeCycle(
                'http://www.sample-videos.com/video/mp4/720/big_buck_bunny_720p_20mb.mp4',
                (BuildContext context, VideoPlayerController controller) =>
                    AspectRatioVideo(controller),
              ),
              AssetPlayerLifeCycle(
                  'assets/Butterfly-209.mp4',
                  (BuildContext context, VideoPlayerController controller) =>
                      VideoInListOfCards(controller)),
            ],
          ),
        ),
      ),
    );
  }
}
