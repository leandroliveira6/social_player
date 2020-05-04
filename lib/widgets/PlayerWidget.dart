import 'package:flutter/material.dart';
import 'package:social_player/controllers/PlayerController.dart';

class PlayerWidget extends StatefulWidget {
  PlayerWidget({Key key}) : super(key: key);

  @override
  _PlayerWidgetState createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  @override
  void dispose() {
    PlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        AspectRatio(
          aspectRatio: 16 / 8,
          child: StreamBuilder(
            stream: PlayerController.playerStream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return snapshot.data;
              }
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        ),
        Row(children: [
          FlatButton(
            child: Text('Play'),
            onPressed: () {
              setState(() {
                PlayerController.play();
              });
            },
          ),
          FlatButton(
            child: Text('Pause'),
            onPressed: () {
              setState(() {
                PlayerController.pause();
              });
            },
          ),
        ]),
      ],
    );
  }
}
