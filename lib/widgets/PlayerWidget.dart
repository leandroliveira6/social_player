import 'package:flutter/material.dart';
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';
import 'package:social_player/controllers/VideoController.dart';

class PlayerWidget extends StatefulWidget {
  PlayerWidget({Key key}) : super(key: key);

  @override
  _PlayerWidgetState createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: VideoController.instance.playerController.ijkStatusStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        Widget widget = Center(
          child: CircularProgressIndicator(),
        );

        if (snapshot.hasData) {
          switch (snapshot.data) {
            case IjkStatus.playing:
            case IjkStatus.pause:
            case IjkStatus.complete:
              widget = IjkPlayer(
                mediaController: VideoController.instance.playerController,
              );
              break;
            case IjkStatus.error:
            case IjkStatus.setDatasourceFail:
              widget = Center(
                child: Text('Houve um erro'),
              );
              break;
          }
        }

        return Container(
          child: AspectRatio(aspectRatio: 16 / 9, child: widget),
        );
      },
    );
  }

  @override
  void dispose() {
    VideoController.instance.dispose();
    super.dispose();
  }
}
