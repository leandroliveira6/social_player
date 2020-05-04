import 'dart:async';

import 'package:social_player/controllers/PlaylistController.dart';
import 'package:video_player/video_player.dart';

class PlayerController {
  static VideoPlayerController _controller;
  static StreamController<VideoPlayer> _playerStreamController;
  static StreamController<String> _titleStreamController;

  PlayerController() {
    print('PlayerController constructor');
    _playerStreamController = StreamController();
    _titleStreamController = StreamController();
  }

  static void dispose() {
    _playerStreamController.close();
    _titleStreamController.close();
  }

  static get playerStream => _playerStreamController.stream;
  static get titleStream => _titleStreamController.stream;

  static void loadPlayer(index, onComplete) async {
    print('PlayerController loadPlayer');
    Map track = PlaylistController.getTrack(index);
    _titleStreamController.sink.add(track['name']);
    _controller?.removeListener(() async {
      await _controller.dispose();
    });
    _controller = VideoPlayerController.network(track['url']);
    _controller.addListener(() async {
      if (_controller.value.position == _controller.value.duration) {
        await _controller.seekTo(Duration.zero);
        await _controller.pause();
        if (onComplete()) {
          await _controller.play();
        }
      }
    });
    _controller.initialize().then((_) {
      _playerStreamController.sink.add(VideoPlayer(_controller));
    });
  }

  static void play() {
    _controller.play();
  }

  static void pause() {
    _controller.pause();
  }
}
