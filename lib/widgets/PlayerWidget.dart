import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayerWidget extends StatefulWidget {
  PlayerWidget({Key key}) : super(key: key);

  @override
  _PlayerWidgetState createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4');
    _controller.initialize();
    _controller.addListener(() {
      if (_controller.value.position == _controller.value.duration) {
        print('Terminou');
        _controller.seekTo(Duration.zero);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        AspectRatio(
          aspectRatio: 16 / 8,
          child: VideoPlayer(_controller),
        ),
        Row(children: [
          FlatButton(
            child: Text('Play'),
            onPressed: () {
              setState(() {
                _controller.play();
              });
            },
          ),
          FlatButton(
            child: Text('Pause'),
            onPressed: () {
              setState(() {
                _controller.pause();
              });
            },
          ),
        ]),
      ],
    );
  }

  void onViewPlayerCreated(controller) {}
}
