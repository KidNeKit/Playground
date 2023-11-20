import 'package:flutter/material.dart';

class StoryItem extends StatelessWidget {
  final double size;
  final String? imagePath;
  final String? label;

  const StoryItem({
    required this.size,
    this.imagePath,
    this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(radius: 35.0),
        const SizedBox(height: 4.0),
        Text('$label'),
      ],
    );
  }
}
