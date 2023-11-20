import 'package:flutter/material.dart';
import 'package:instagram/src/utils/inst_fonts.dart';

class MediaInfoCol extends StatelessWidget {
  final String quantity;
  final String label;

  const MediaInfoCol({
    required this.quantity,
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          quantity,
          style: InstFonts.bold14.copyWith(color: Colors.black),
        ),
        Text(
          label,
          style: InstFonts.regular14.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
