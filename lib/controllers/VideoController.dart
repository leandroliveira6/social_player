import 'dart:async';

// import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';
import 'package:social_player/models/Video.dart';

class VideoController {
  static var _instance;

  int _currentVideoIndex;
  List<Video> _videos;
  StreamController<String> _videoTitleController;

  // IjkMediaController _playerController;

  static get instance => _instance;
  static get newInstance => _instance = VideoController();

  set videos(newVideos) => _videos.addAll(newVideos);
  get videos => _videos;
  get currentVideo => _videos[_currentVideoIndex];
  get videoTitleStream => _videoTitleController.stream;

  // get playerController => _playerController;

  VideoController() {
    _currentVideoIndex = 0;
    _videos = List<Video>();
    _videoTitleController = StreamController.broadcast();
    // _playerController = IjkMediaController();
    // _playerController.ijkStatusStream.listen((status) {
    //   final videoInfo = _playerController.videoInfo;
    //   print('DEBUG STATUS: $status');
    //   if (status == IjkStatus.complete && videoInfo.progress > 0.9) {
    //     nextVideo();
    //   }
    // });
  }

  selectVideo(video, {automaticPlay = true}) {
    _videos[_currentVideoIndex].selected = false;
    _currentVideoIndex = _videos.indexOf(video);
    video.selected = true;
    loadVideo(video.url, automaticPlay: automaticPlay);
    print('Novo video selecionado: ${video.title}');
  }

  nextVideo() {
    var newIndex = _currentVideoIndex + 1;
    if (newIndex != _videos.length) {
      selectVideo(_videos[newIndex]);
    }
  }

  previousVideo() {
    var newIndex = _currentVideoIndex - 1;
    if (newIndex >= 0) {
      selectVideo(_videos[newIndex]);
    }
  }

  selectFirstVideoNotViewed() {
    Video video = _videos.firstWhere((video) {
      if (!video.viewed) {
        return true;
      }
      return false;
    });
    selectVideo(video, automaticPlay: false);
  }

  loadVideo(url, {automaticPlay = true}) {
    print('automaticPlay: $automaticPlay');
    // _playerController.pause().then((_) {
    //   _playerController.setNetworkDataSource(url, autoPlay: true).then((_) {
    //     _videoTitleController.sink.add(currentVideo.title);
    //     if (automaticPlay == false) {
    //       Timer.periodic(Duration(seconds: 1), (timer) async {
    //         final videoInfo = await _playerController.getVideoInfo();
    //         if (videoInfo.duration > 0) {
    //           _playerController.pause();
    //           timer.cancel();
    //         }
    //       });
    //     }
    //   });
    // });
  }

  dispose() {
    // _playerController.dispose();
    _videoTitleController.close();
  }

  static final detailExampleJson = {
    'title': 'Playlist de Teste',
    'items': [
      {
        'title': 'Videos diversos',
        'videos': [
          {
            'title': 'Video 1',
            'url':
                'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
            'viewed': true,
          },
          {
            'title': 'Video 2',
            'url':
                'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
            'viewed': false,
          },
          {
            'title': 'Video 3',
            'url':
                'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4',
            'viewed': false,
          },
          {
            'title': 'Video 4',
            'url':
                'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
            'viewed': false,
          },
          {
            'title': 'Video 5 Diferentão',
            'url':
                'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4',
            'viewed': false,
          },
          {
            'title': 'Video 6 da abelhinha',
            'url':
                'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
            'viewed': false
          }
        ]
      }
    ]
  };
}
