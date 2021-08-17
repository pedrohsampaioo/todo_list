import 'package:flutter/material.dart';

import 'package:todo_list/app/config/theme/app_colors.dart';

class SeparatorWidget extends StatelessWidget {
  const SeparatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 16),
        Container(
          margin: const EdgeInsets.only(left: 68),
          color: AppColors.black.withOpacity(0.1),
          height: 1,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
