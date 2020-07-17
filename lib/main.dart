import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_test/bp_widget.dart';
import 'package:video_player_test/vlc_widget.dart';
import 'chewie_list_item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      bottomNavigationBar: Row(
        children: <Widget>[
          Expanded(
            child: RaisedButton(
              child: Text(
                'VLC',
                style: TextStyle(color: Colors.black),
              ),
              color: Colors.yellowAccent,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => VlcVideo()));
              },
            ),
          ),
          Expanded(
            child: RaisedButton(
              child: Text('BP'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BpPlayer()));
              },
            ),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          ChewieListItem(
            videoPlayerController: VideoPlayerController.asset(
              'assets/videos/IntroVideo.mp4',
            ),
            looping: true,
          ),
          // ChewieListItem(
          //   videoPlayerController: VideoPlayerController.network(
          //     'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
          //   ),
          // ),
          ChewieListItem(
            videoPlayerController: VideoPlayerController.network(
              'https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_1920_18MG.mp4',
            ),
          ),
          // ChewieListItem(
          //   videoPlayerController: VideoPlayerController.network(
          //     'https://download.blender.org/peach/bigbuckbunny_movies/BigBuckBunny_320x180.mp4',
          //   ),
          // ),
          // ChewieListItem(
          //   videoPlayerController: VideoPlayerController.network(
          //     'https://download.blender.org/peach/bigbuckbunny_movies/BigBuckBunny_640x360.m4v',
          //   ),
          // ),
          // ChewieListItem(
          //   videoPlayerController: VideoPlayerController.network(
          //     'https://download.blender.org/peach/bigbuckbunny_movies/big_buck_bunny_1080p_h264.mov',
          //   ),
          // ),
          // ChewieListItem(
          //   videoPlayerController: VideoPlayerController.network(
          //     'https://file-examples.com/wp-content/uploads/2018/04/file_example_WMV_1920_9_3MB.wmv',
          //   ),
          // ),
        ],
      ),
    );
  }
}
