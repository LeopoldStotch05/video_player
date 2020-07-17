import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player_test/video_list/video_list_data.dart';

class VideoListWidget extends StatefulWidget {
  final VideoListData videoListData;

  const VideoListWidget({Key key, this.videoListData}) : super(key: key);

  @override
  _VideoListWidgetState createState() => _VideoListWidgetState();
}

class _VideoListWidgetState extends State<VideoListWidget> {
  VideoListData get videoListData => widget.videoListData;
  BetterPlayerConfiguration betterPlayerConfiguration;
  BetterPlayerListVideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = BetterPlayerListVideoPlayerController();
    betterPlayerConfiguration = BetterPlayerConfiguration(autoPlay: false);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              videoListData.videoTitle,
              style: TextStyle(fontSize: 50),
            ),
          ),
          AspectRatio(
              child: BetterPlayerListVideoPlayer(
                BetterPlayerDataSource(BetterPlayerDataSourceType.NETWORK, videoListData.videoUrl),
                configuration: BetterPlayerConfiguration(autoPlay: false),
                key: Key(videoListData.hashCode.toString()),
                playFraction: 0.8,
                betterPlayerListVideoPlayerController: controller,
              ),
              aspectRatio: 16 / 9),
          Row(children: [
            RaisedButton(
              child: Text("Play"),
              onPressed: () {
                controller.play();
              },
            ),
            const SizedBox(width: 8),
            RaisedButton(
              child: Text("Pause"),
              onPressed: () {
                controller.pause();
              },
            ),
          ])
        ],
      ),
    );
  }
}
