import 'package:flutter/material.dart';
import 'package:social_player/controllers/PlaylistController.dart';

class DrawerWidget extends StatefulWidget {
  DrawerWidget({Key key}) : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              child: StreamBuilder(
                stream: PlaylistController.playlistStream,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return UserAccountsDrawerHeader(
                      accountName: Text(snapshot.data['name']),
                      accountEmail: Text(snapshot.data['author']),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            Expanded(
              child: StreamBuilder(
                stream: PlaylistController.tracksStream,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        Map<String, dynamic> track = snapshot.data[index];
                        return ListTile(
                          title: Text(track['name']),
                          trailing: track.containsKey('viewed')
                              ? Icon(
                                  Icons.check_circle,
                                  color: Colors.greenAccent,
                                )
                              : Icon(Icons.check_circle_outline,
                                  color: Colors.grey),
                          onTap: () {
                            PlaylistController.initTrack(index);
                          },
                        );
                      },
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

// decoration: BoxDecoration(color: Colors.transparent),
// margin: EdgeInsets.all(0),
// padding: EdgeInsets.all(0),
// margin: EdgeInsets.all(0),
// decoration: BoxDecoration(
//   gradient: LinearGradient(
//       colors: [Colors.black87, Colors.transparent],
//       begin: AlignmentDirectional.topCenter,
//       end: AlignmentDirectional.bottomCenter),
// ),
