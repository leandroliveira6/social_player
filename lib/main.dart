import 'package:flutter/material.dart';
import 'package:social_player/controllers/VideoController.dart';
import 'models/Detail.dart';
import 'pages/DetailPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final detail = Detail.fromJson(VideoController.detailExampleJson);
    return MaterialApp(
      title: 'Social Player',
      theme: ThemeData.dark(),
      home: DetailPage(detail),
    );
  }
}

// class PlayerTeste extends StatefulWidget {
//   final detail;

//   PlayerTeste(this.detail, {Key key}) : super(key: key);

//   @override
//   _PlayerTesteState createState() => _PlayerTesteState();
// }

// class _PlayerTesteState extends State<PlayerTeste> {
//   FijkPlayer _controller;

//   @override
//   void initState() {
//     _controller = FijkPlayer();
//     _controller.addListener(() {
//       print('Listener Event: ${_controller.state}');
//       if (_controller.state == FijkState.completed) {
//         print('Avançando video');
//         currentVideo = currentVideo + 1 == link.length ? 0 : currentVideo + 1;
//         _controller.reset().then((onValue) {
//           print('Reset completo');
//           _controller.setDataSource(link[currentVideo], autoPlay: true);
//         });
//       }
//     });
//     _controller.setDataSource(link[currentVideo]);

//     // _controller.init();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         child: Column(
//       children: <Widget>[
//         AspectRatio(
//           aspectRatio: 16 / 9,
//           child: FijkView(
//             player: _controller,
//           ),
//         ),
//         RaisedButton(
//           child: Text('Voltar'),
//           onPressed: () {
//             print('Voltar');
//             currentVideo =
//                 currentVideo == 0 ? link.length - 1 : currentVideo - 1;
//             _controller.reset().then((onValue) {
//               print('Reset completo');
//               _controller.setDataSource(link[currentVideo], autoPlay: true);
//             });
//           },
//         ),
//         RaisedButton(
//           child: Text('Play'),
//           onPressed: () {
//             print('Play');
//             _controller.start();
//           },
//         ),
//         RaisedButton(
//           child: Text('Pause'),
//           onPressed: () {
//             print('Pause');
//             _controller.pause();
//           },
//         ),
//         RaisedButton(
//           child: Text('Avançar'),
//           onPressed: () {
//             print('Avançar');
//             currentVideo =
//                 currentVideo + 1 == link.length ? 0 : currentVideo + 1;
//             _controller.reset().then((onValue) {
//               print('Reset completo');
//               _controller.setDataSource(link[currentVideo], autoPlay: true);
//             });
//           },
//         ),
//       ],
//     ));
//   }

//   @override
//   void dispose() {
//     _controller.release();
//     super.dispose();
//   }
// }
