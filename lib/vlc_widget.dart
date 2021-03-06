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
            child: VlcPlayer(
              aspectRatio: 16 / 9,
              url: 'https://file-examples-com.github.io/uploads/2018/04/file_example_MOV_1920_2_2MB.mov',
              controller: controller,
              placeholder: Center(child: CircularProgressIndicator()),
            )));
  }
}
