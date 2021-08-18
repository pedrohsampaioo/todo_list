import 'package:flutter/material.dart';

class CategoryWidgeet extends StatelessWidget {
  final Color backgroundColor;
  final Color titleColor;
  final Color subtitleColor;
  final String title;
  final int tasksAmount;

  const CategoryWidgeet({
    Key? key,
    required this.backgroundColor,
    required this.titleColor,
    required this.subtitleColor,
    required this.title,
    required this.tasksAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            textAlign: TextAlign.start,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style:
                Theme.of(context).textTheme.headline4!.apply(color: titleColor),
          ),
          const SizedBox(height: 4),
          Text(
            '$tasksAmount ${tasksAmount > 1 ? 'tasks' : 'task'}',
            textAlign: TextAlign.start,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .apply(color: subtitleColor),
          ),
        ],
      ),
    );
  }
}
