import 'package:social_player/models/Item.dart';

class Detail {
  String _title;
  List<Item> _items;

  Detail.fromJson(Map<String, dynamic> json) {
    _title = json['title'] ?? 'Sem título';
    _items = List.generate(json['items'] != null ? json['items'].length : 0, (index) {
      return Item.fromJson(json['items'][index]);
    });
  }

  get title => _title;
  List<Item> get items => _items;
}
