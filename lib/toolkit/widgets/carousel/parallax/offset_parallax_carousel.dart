import 'package:flutter/material.dart';

class OffsetParallaxCarousel extends StatefulWidget {
  final double aspectRatio;
  final double horizontalPadding;
  final List<String> items;
  final PageController pageController;
  final Function(int)? onItemPressed;
  final BorderRadius borderRadius;

  const OffsetParallaxCarousel({
    required this.items,
    required this.pageController,
    this.aspectRatio = 1.0,
    this.horizontalPadding = 10.0,
    this.borderRadius = BorderRadius.zero,
    this.onItemPressed,
    super.key,
  });

  @override
  State<OffsetParallaxCarousel> createState() => _OffsetParallaxCarouselState();
}

class _OffsetParallaxCarouselState extends State<OffsetParallaxCarousel> {
  late double pageOffset;

  @override
  void initState() {
    super.initState();

    pageOffset = 0.0;
    widget.pageController.addListener(() {
      setState(() {
        pageOffset = widget.pageController.page ?? 0.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widget.aspectRatio,
      child: PageView.builder(
        controller: widget.pageController,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: widget.horizontalPadding),
            child: GestureDetector(
              onTap: widget.onItemPressed != null
                  ? () => widget.onItemPressed!(index)
                  : null,
              child: Stack(
                alignment: AlignmentDirectional.center,
                fit: StackFit.expand,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: widget.borderRadius,
                    child: Image.network(
                      widget.items[index],
                      fit: BoxFit.cover,
                      alignment: Alignment(-pageOffset.abs() + index, 0),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: widget.items.length,
      ),
    );
  }
}
