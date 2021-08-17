import 'package:flutter/material.dart';

import 'package:todo_list/app/config/theme/app_colors.dart';

class TaskItemWidget extends StatelessWidget {
  final bool isCompleted;
  final String decription;
  final Color groupColor;

  const TaskItemWidget({
    Key? key,
    required this.isCompleted,
    required this.decription,
    required this.groupColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        _buildCheck(isCompleted),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            decription,
            style: Theme.of(context).textTheme.bodyText1!.apply(
                  color: isCompleted
                      ? AppColors.black.withOpacity(0.5)
                      : AppColors.black,
                ),
          ),
        ),
        const SizedBox(width: 16),
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: groupColor,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }

  Widget _buildCheck(bool isCompleted) {
    final animationDuration = const Duration(milliseconds: 300);
    return AnimatedContainer(
      width: 32,
      height: 32,
      duration: animationDuration,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: isCompleted
            ? Border.all(width: 0, color: Colors.transparent)
            : Border.all(width: 2, color: AppColors.gray),
        color: isCompleted ? AppColors.blue : AppColors.white,
      ),
      child: AnimatedSwitcher(
        duration: animationDuration,
        reverseDuration: animationDuration,
        child: isCompleted
            ? Icon(
                Icons.check,
                color: AppColors.white,
                size: 24,
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
