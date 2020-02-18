import 'package:flutter/material.dart';
import 'package:social_player/controllers/VideoController.dart';
import 'package:social_player/models/Item.dart';
import 'package:social_player/models/Video.dart';

class ItemTileWidget extends StatelessWidget {
  Item item;
  List<Video> _videos;
  VideoController _controller;

  ItemTileWidget(this.item, {Key key}) : super(key: key) {
    print('constructor ItemTileWidget');
    _videos = item.videos;
    _controller = VideoController.instance;
  }

  @override
  Widget build(BuildContext context) {
    print('build ItemTileWidget');
    return Container(
      child: ExpansionTile(
        title: Text(item.title),
        children: List.generate(_videos.length, (index) {
          return ListTile(
            title: Text(
              _videos[index].title,
            ),
            onTap: () {
              _controller.selectVideo(_videos[index]);
              Navigator.pop(context);
            },
            trailing: _videos[index].viewed
                ? Icon(Icons.check_box)
                : Icon(Icons.check_box_outline_blank),
            selected: _videos[index].selected,
          );
        }),
      ),
    );
  }
}
