import 'package:social_player/models/Video.dart';

class Item {
  String _title;
  List<Video> _videos;

  Item.fromJson(Map<String, dynamic> json) {
    _title = json['title'];
    _videos = List.generate(json['videos'] != null ? json['videos'].length : 0, (index) {
      return Video.fromJson(json['videos'][index]);
    });
  }

  get title => _title;
  List<Video> get videos => _videos;
}
