import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:playground/toolkit/widgets/carousel/parallax/parallax_carousel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();

    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              ParallaxCarousel(
                items: const <String>[
                  'https://wallpapers.com/images/hd/wooden-cottage-sea-high-resolution-d7fahhz6phtkdveh.jpg',
                  'https://images.unsplash.com/photo-1580757468214-c73f7062a5cb?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8MTYlM0E5fGVufDB8fDB8fHww',
                  'https://ipt.imgix.net/205983/x/0/horizontal-lines-as-a-compositional-tool-in-photography-7.jpg?auto=compress%2Cformat&ch=Width%2CDPR&dpr=1&ixlib=php-3.3.0&w=883',
                  'https://images.all-free-download.com/images/graphiclarge/beach_cloud_dawn_horizon_horizontal_landscape_ocean_601821.jpg',
                  'https://wallpapers.com/images/hd/wooden-cottage-sea-high-resolution-d7fahhz6phtkdveh.jpg',
                ],
                aspectRatio: 16 / 9,
                borderRadius: BorderRadius.circular(20.0),
                pageController: pageController,
                onItemPressed: (index) {
                  log('Pressed index: $index');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
