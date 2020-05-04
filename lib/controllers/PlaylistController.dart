import 'dart:async';

import 'package:social_player/controllers/PlayerController.dart';

class PlaylistController {
  static String _id;
  static Map _playlist;
  static List<Map<String, dynamic>> _tracks;

  static get tracks => _tracks;
  static Map getTrack(index) => _tracks[index];

  PlaylistController(id) {
    print('PlaylistController constructor $_id $id');
    if (_id != id) {
      _playlist = null;
      _tracks = null;
      _id = id;
    }
    _init();
  }

  static void _init() {
    getPlaylist();
    getTracks();
  }

  static Future getPlaylist() {
    if (_playlist == null) {
      return _fetchPlaylist(_id).then((playlist) {
        _playlist = playlist;
        return _playlist;
      });
    }
    return Future.value(_playlist);
  }

  static Future getTracks() {
    if (_tracks == null) {
      return _fetchTracks(_id).then((tracks) {
        _tracks = tracks;
        for (int i = 0; i < _tracks.length; i++) {
          if (!_tracks[i].containsKey('viewed')) {
            initTrack(i);
            break;
          }
        }
        return _tracks;
      });
    }
    return Future.value(_tracks);
  }

  static void initTrack(index) {
    PlayerController.loadPlayer(index, () {
      _markAsSeen(index);
      if (index + 1 != _tracks.length) {
        print('Avançando track para ${index + 1}');
        initTrack(index + 1);
        return true;
      }
      print('Playlist terminou');
      return false;
    });
  }

  static void _markAsSeen(index) {
    _tracks[index].putIfAbsent('viewed', () => true);
  }

  static Future<Map<String, dynamic>> _fetchPlaylist(id) async {
    return Future.delayed(Duration(seconds: 1), () {
      return {
        'id': 'kajfja93',
        'name': 'Videos misturados',
        'author': 'leandroliveira6'
      };
    });
  }

  static Future<List<Map<String, dynamic>>> _fetchTracks(id) async {
    return Future.delayed(Duration(seconds: 2), () {
      return [
        {
          'id': 'aur-9au25q',
          'name': 'Video 1',
          'viewed': true,
          'url':
              'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
        },
        {
          'id': '9u-i32r-03',
          'name': 'Video 2',
          'url':
              'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
        },
        {
          'id': 'i4t-43i0t3',
          'name': 'Video 3',
          'url':
              'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4',
        },
        {
          'id': '-496jw´gwe',
          'name': 'Video 4',
          'url':
              'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
        },
        {
          'id': '02i3t0-wjr',
          'name': 'Video 5',
          'url':
              'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4',
        },
        {
          'id': 'jwp30g´343',
          'name': 'Video 6',
          'url':
              'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
        }
      ];
    });
  }
}
