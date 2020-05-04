import 'package:flutter/material.dart';
import 'pages/DetailPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Player',
      theme: ThemeData.dark(),
      home: DetailPage(
        playlistId: 'u2c982n931',
      ),
    );
  }
}
