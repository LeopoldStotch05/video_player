import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class VlcVideo extends StatefulWidget {
  @override
  _VlcVideoState createState() => _VlcVideoState();
}

class _VlcVideoState extends State<VlcVideo> {
  VlcPlayerController controller;
  final double playerWidth = 640;
  final double playerHeight = 360;

  @override
  void initState() {
    controller = VlcPlayerController(onInit: () {
      controller.play();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SizedBox(
            height: playerHeight,
            width: playerWidth,
            child: new VlcPlayer(
              aspectRatio: 16 / 9,
              url: 'https://file-examples.com/wp-content/uploads/2018/04/file_example_WMV_1920_9_3MB.wmv',
              controller: controller,
              placeholder: Center(child: CircularProgressIndicator()),
            )));
  }
}
