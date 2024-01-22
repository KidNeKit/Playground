import 'package:flutter/material.dart';

import 'toolkit/widgets/carousel/parallax/flow_parallax_carousel/flow_parallax_carousel.dart';

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
              FlowParallaxCarousel(
                pageController: pageController,
                borderRadius: BorderRadius.circular(20.0),
                items: const [
                  'https://miro.medium.com/v2/resize:fit:1358/0*u9EBS_967l84_0N2',
                  'https://images.all-free-download.com/images/graphiclarge/beach_cloud_dawn_horizon_horizontal_landscape_ocean_601821.jpg',
                  'https://wallpapers.com/images/hd/wooden-cottage-sea-high-resolution-d7fahhz6phtkdveh.jpg',
                ],
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
