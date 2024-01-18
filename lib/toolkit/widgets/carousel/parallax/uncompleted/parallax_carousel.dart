import 'package:flutter/material.dart';

import 'parallax_flow_delegate.dart';


class ParallaxCarousel extends StatefulWidget {
  final List<String> items;
  final VoidCallback? onItemPressed;
  final double aspectRatio;
  final double horizontalMargin;
  final BorderRadius borderRadius;

  const ParallaxCarousel({
    required this.items,
    this.onItemPressed,
    this.aspectRatio = 2 / 1,
    this.horizontalMargin = 10.0,
    this.borderRadius = BorderRadius.zero,
    super.key,
  });

  @override
  State<ParallaxCarousel> createState() => _ParallaxCarouselState();
}

class _ParallaxCarouselState extends State<ParallaxCarousel> {
  late PageController pageController;
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        AspectRatio(
          aspectRatio: widget.aspectRatio,
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return _CarouselItem(
                imagePath:
                    'https://wallpapers.com/images/hd/wooden-cottage-sea-high-resolution-d7fahhz6phtkdveh.jpg',
                horizontalMargin: widget.horizontalMargin,
                borderRadius: widget.borderRadius,
              );
            },
            itemCount: 10,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}

class _CarouselItem extends StatelessWidget {
  final String imagePath;
  final double horizontalMargin;
  final BorderRadius borderRadius;
  final GlobalKey itemGlobalKey = GlobalKey();

  _CarouselItem({
    required this.imagePath,
    required this.horizontalMargin,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: horizontalMargin,
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Stack(
          children: <Widget>[
            _buildParallaxBackground(context),
            _buildGradient(),
            //_buildTitleAndSubtitle(),
          ],
        ),
      ),
    );
  }

  Widget _buildParallaxBackground(BuildContext context) {
    return Flow(
      delegate: ParallaxFlowDelegate(
        scrollable: Scrollable.of(context),
        listItemContext: context,
        backgroundImageKey: itemGlobalKey,
      ),
      children: [
        Image.network(
          imagePath,
          fit: BoxFit.cover,
          key: itemGlobalKey,
        ),
      ],
    );
  }

  Widget _buildGradient() {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.7),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.6, 0.95],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleAndSubtitle() {
    return const SizedBox.shrink();
  }
}
