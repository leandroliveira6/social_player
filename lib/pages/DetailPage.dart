import 'package:flutter/material.dart';
// import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';
import 'package:social_player/controllers/VideoController.dart';
import 'package:social_player/models/Detail.dart';
import 'package:social_player/widgets/ListItemWidget.dart';
import 'package:social_player/widgets/PlayerWidget.dart';

class DetailPage extends StatelessWidget {
  Detail detail;
  VideoController _controller;

  DetailPage(this.detail, {Key key}) : super(key: key) {
    print('constructor DetailPage');
    _controller = VideoController.newInstance;
    for (var item in detail.items) {
      _controller.videos = item.videos;
    }
    print(_controller.videos.length);
    _controller.selectFirstVideoNotViewed();
  }

  @override
  Widget build(BuildContext context) {
    print('build DetailPage');
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: _controller.videoTitleStream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data);
            }
            return Text('Carregando...');
          },
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              child: UserAccountsDrawerHeader(
                accountName: Text(detail.title, style: TextStyle(fontSize: 22)),
                accountEmail: Text(''),
                decoration: BoxDecoration(color: Colors.transparent),
                margin: EdgeInsets.all(0),
              ),
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.all(0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.black87, Colors.transparent],
                    begin: AlignmentDirectional.topCenter,
                    end: AlignmentDirectional.bottomCenter),
              ),
            ),
            Expanded(child: ListItemWidget(detail.items)),
          ],
        ),
      ),
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
