import 'package:flutter/material.dart';
import 'package:instagram/src/ui/inst_profile_header/media_info_col.dart';

class AvatarRow extends StatelessWidget {
  const AvatarRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 2,
          child: CircleAvatar(
            radius: 37.0,
            backgroundColor: Colors.grey,
          ),
        ),
        Flexible(
          flex: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MediaInfoCol(
                quantity: '3',
                label: 'Публикации',
              ),
              MediaInfoCol(
                quantity: '124',
                label: 'Подписчики',
              ),
              MediaInfoCol(
                quantity: '108',
                label: 'Подписки',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
