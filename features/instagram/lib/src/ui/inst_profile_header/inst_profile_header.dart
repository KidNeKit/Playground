import 'package:flutter/material.dart';
import 'package:instagram/src/ui/inst_profile_header/avatar_row.dart';
import 'package:instagram/src/utils/inst_fonts.dart';

class InstProfileHeader extends StatelessWidget {
  const InstProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AvatarRow(),
          const SizedBox(height: 6.0),
          Text(
            'Nikita Menshikov',
            style: InstFonts.bold13.copyWith(color: Colors.black),
          ),
          const SizedBox(height: 3.0),

        ],
      ),
    );
  }
}
