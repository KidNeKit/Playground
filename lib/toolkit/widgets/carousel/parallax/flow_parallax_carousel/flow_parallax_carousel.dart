import 'package:flutter/material.dart';

import 'parallax_flow_delegate.dart';

class FlowParallaxCarousel extends StatelessWidget {
  final double aspectRatio;
  final double horizontalPadding;
  final List<String> items;
  final PageController pageController;
  final Function(int)? onItemPressed;
  final BorderRadius borderRadius;

  const FlowParallaxCarousel({
    required this.items,
    required this.pageController,
    this.aspectRatio = 2 / 1,
    this.horizontalPadding = 20.0,
    this.borderRadius = BorderRadius.zero,
    this.onItemPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: onItemPressed != null ? () => onItemPressed!(index) : null,
            child: CarouselItem(
              imagePath: items[index],
              borderRadius: borderRadius,
              horizontalPadding: horizontalPadding,
            ),
          );
        },
        itemCount: items.length,
      ),
    );
  }
}

class CarouselItem extends StatelessWidget {
  final String imagePath;
  final double horizontalPadding;
  final BorderRadius borderRadius;

  final GlobalKey itemGlobalKey = GlobalKey();

  CarouselItem({
    required this.imagePath,
    required this.horizontalPadding,
    required this.borderRadius,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontalPadding),
      decoration: BoxDecoration(
        borderRadius: borderRadius,
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Stack(
          children: [
            _buildImage(context),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return Flow(
      delegate: ParallaxFlowDelegate(
        scrollable: Scrollable.of(context),
        listItemContext: context,
        backgroundImageKey: itemGlobalKey,
      ),
      children: [
        Image.network(
          key: itemGlobalKey,
          fit: BoxFit.cover,
          imagePath,
        ),
      ],
    );
  }
}
