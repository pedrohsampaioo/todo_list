import 'package:flutter/material.dart';
import 'package:todo_list/app/config/categories/category_theme.dart';

import 'package:todo_list/app/config/theme/app_colors.dart';
import 'package:todo_list/app/features/home/widgets/category_widget.dart';
import 'package:todo_list/app/features/home/widgets/separator_widget.dart';
import 'package:todo_list/app/features/home/widgets/task_item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 32),
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          _buildTasks(context),
          _buildCategories(context),
        ],
      ),
    );
  }

  Widget _buildTasks(BuildContext context) => SafeArea(
        bottom: false,
        child: MediaQuery.removePadding(
          context: context,
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TaskItemWidget(
                groupColor: AppColors.green,
                isCompleted: false,
                decription: 'Start making a presentation',
              ),
            ),
            separatorBuilder: (context, index) => const SeparatorWidget(),
            itemCount: 30,
            shrinkWrap: true,
          ),
        ),
      );

  Widget _buildCategories(BuildContext context) {
    final categories = CategoryThemeVariations.values.map<Widget>(
      (categoryTheme) {
        final variation = CategoryTheme.chooseVariation(categoryTheme);
        return CategoryWidgeet(
          backgroundColor: variation.backgroundColor,
          titleColor: variation.titleColor,
          subtitleColor: variation.subtitleColor,
          title: 'Title 1',
          tasksAmount: 5,
        );
      },
    ).toList();
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Categories',
              textAlign: TextAlign.start,
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .apply(color: AppColors.black),
            ),
            const SizedBox(height: 32),
            MediaQuery.removePadding(
              removeTop: true,
              removeBottom: true,
              context: context,
              child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => categories[index],
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemCount: categories.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
