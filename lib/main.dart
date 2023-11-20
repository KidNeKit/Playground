import 'package:flutter/material.dart';
import 'package:instagram/instargam.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InstProfileScreen(),
    );
  }
}
