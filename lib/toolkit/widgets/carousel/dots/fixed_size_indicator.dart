import 'dart:math';

import 'package:flutter/material.dart';

class FixedSizeIndicator extends StatefulWidget {
  final int maxLength;
  final int length;
  final int index;
  final double height;
  final double separator;
  final Duration duration;

  const FixedSizeIndicator({
    required this.index,
    required this.length,
    this.height = 20.0,
    this.separator = 8.0,
    this.maxLength = 7,
    this.duration = const Duration(milliseconds: 200),
    super.key,
  }) : assert(maxLength >= 5);

  @override
  State<FixedSizeIndicator> createState() => _FixedSizeIndicatorState();
}

class _FixedSizeIndicatorState extends State<FixedSizeIndicator> {
  late int scrolledIndex;
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrolledIndex = 0;
    scrollController = ScrollController();
  }

  @override
  void didUpdateWidget(covariant FixedSizeIndicator oldWidget) {
    if (widget.index != oldWidget.index && scrollController.hasClients) {
      onPageChanged(oldWidget.index);
    }
    super.didUpdateWidget(oldWidget);
  }

  double _calculateDotHeight(int index) {
    final int leftOuterIndex = scrolledIndex + 2;
    final int rightOuterIndex = scrolledIndex + widget.maxLength - 3;
    final bool isStart = leftOuterIndex == 2;
    final bool isEnd = rightOuterIndex == widget.length - 3;

    if ((leftOuterIndex - 1 == index && !isStart) ||
        (rightOuterIndex + 1 == index && !isEnd)) {
      return 0.7 * widget.height;
    } else if ((leftOuterIndex - 2 == index && !isStart) ||
        (rightOuterIndex + 2 == index && !isEnd)) {
      return 0.5 * widget.height;
    } else if (index >= scrolledIndex &&
        index < scrolledIndex + widget.maxLength) {
      return widget.height;
    }
    return 0.0;
  }

  double _calculateIndicatorWidth() {
    return widget.height * widget.maxLength +
        widget.separator * (widget.maxLength - 1);
  }

  void onPageChanged(int oldIndex) {
    final int leftOuterIndex = scrolledIndex + 2;
    final int rightOuterIndex = scrolledIndex + widget.maxLength - 3;
    if (widget.index < leftOuterIndex && scrolledIndex != 0) {
      scrolledIndex--;
      setState(() {});
      scrollToIndex();
    } else if (widget.index > rightOuterIndex &&
        widget.index < widget.length - 2) {
      scrolledIndex++;
      setState(() {});
      scrollToIndex();
    }
  }

  void scrollToIndex() {
    final double offsetPerPosition = widget.height + widget.separator;
    final double widgetOffset = scrolledIndex * offsetPerPosition;
    scrollController.animateTo(
      min(widgetOffset, scrollController.position.maxScrollExtent),
      duration: widget.duration,
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: _calculateIndicatorWidth(),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        controller: scrollController,
        itemBuilder: (context, index) {
          return SizedBox(
            height: widget.height,
            width: widget.height,
            child: Center(
              child: AnimatedDotIndicator(
                isActive: widget.index == index,
                height: _calculateDotHeight(index),
                duration: widget.duration,
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: widget.separator,
          );
        },
        itemCount: widget.length,
      ),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}

class AnimatedDotIndicator extends StatelessWidget {
  final bool isActive;
  final double height;
  final Duration duration;

  const AnimatedDotIndicator({
    required this.isActive,
    required this.height,
    required this.duration,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: height,
      width: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Colors.purple : Colors.grey,
      ),
      duration: duration,
    );
  }
}
