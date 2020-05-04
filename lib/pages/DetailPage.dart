import 'package:flutter/material.dart';
import 'package:social_player/controllers/PlayerController.dart';
import 'package:social_player/controllers/PlaylistController.dart';
import 'package:social_player/widgets/DrawerWidget.dart';
import 'package:social_player/widgets/PlayerWidget.dart';

class DetailPage extends StatelessWidget {
  final String playlistId;
  DetailPage({Key key, this.playlistId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PlaylistController(playlistId);
    PlayerController();

    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: PlayerController.titleStream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data);
            }
            return Text('Carregando...');
          },
        ),
      ),
      drawer: DrawerWidget(),
      body: Container(
        child: PlayerWidget(),
      ),
    );
  }
}

// decoration: BoxDecoration(
//   gradient: LinearGradient(
//     begin: Alignment.topCenter,
//     end: Alignment.bottomCenter,
//     stops: [0, 0.1],
//     colors: [Colors.black87, Colors.black],
//   ),
// ),
