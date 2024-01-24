import 'package:flutter/material.dart';

class BaseDots extends StatelessWidget {
  final int itemCount;
  final int index;
  final int maxDotCount;

  const BaseDots({
    required this.itemCount,
    required this.index,
    this.maxDotCount = 7,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        itemCount,
        (index) => DotItem(
          isActive: this.index == index,
        ),
      ),
    );
  }
}

class DotItem extends StatelessWidget {
  final bool isActive;

  const DotItem({
    required this.isActive,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12.0,
      width: 12.0,
      margin: const EdgeInsets.symmetric(horizontal: 3.0),
      decoration: BoxDecoration(
        color: isActive ? Colors.purple : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}
