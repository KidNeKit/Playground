import 'package:flutter/material.dart';
import 'package:playground/ui/screens/sliver_list_screen.dart';
import 'package:playground/ui/widgets/slivers/my_header.dart';
import 'package:playground/ui/widgets/slivers/my_header2.dart';
import 'package:playground/ui/widgets/slivers/spotify.dart';
import 'package:playground/ui/widgets/slivers/telegram.dart';

void main() {
  runApp(const PlaygroundApp());
}

class PlaygroundApp extends StatelessWidget {
  const PlaygroundApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Spotify(),
    );
  }
}
