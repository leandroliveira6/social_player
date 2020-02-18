import 'package:flutter/material.dart';
import 'package:social_player/widgets/ItemTileWidget.dart';

class ListItemWidget extends StatelessWidget {
  final listItems;

  const ListItemWidget(this.listItems, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build ListItemWidget');
    return Container(
      // height: 200,
      // foregroundDecoration: BoxDecoration(
      //   gradient: LinearGradient(
      //     begin: Alignment.topCenter,
      //     end: Alignment.bottomCenter,
      //     stops: [0.9, 1],
      //     colors: [Colors.transparent, Colors.black],
      //   ),
      // ),
      child: ListView.builder(
        itemCount: listItems.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemTileWidget(listItems[index]);
        },
      ),
    );
  }
}
