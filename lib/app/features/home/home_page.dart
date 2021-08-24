import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:todo_list/app/config/theme/app_colors.dart';
import 'package:todo_list/app/features/home/widgets/category_widget.dart';
import 'package:todo_list/app/features/home/widgets/separator_widget.dart';
import 'package:todo_list/app/features/home/widgets/task_item_widget.dart';
import 'package:todo_list/app/shared/infra/models/category_model.dart';
import 'package:todo_list/app/shared/infra/models/task_model.dart';
import 'package:todo_list/app/shared/providers/notifiers.dart';
import 'package:todo_list/app/config/categories/category_theme.dart';
import 'package:todo_list/app/auto_route_config.gr.dart';

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        context.read(handleTodoListStateNotifierProvider.notifier).init();
      });
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer(
        builder: (context, watch, _) {
          final handleTodoListState =
              watch(handleTodoListStateNotifierProvider);
          return handleTodoListState.map(
            started: (_) => const SizedBox.shrink(),
            listeningCategories: (data) => ListView(
              padding: const EdgeInsets.symmetric(vertical: 32),
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: [
                _buildTasks(
                  context: context,
                  tasks: data.categories
                      .expand<TaskModel>((category) => [...category.tasks])
                      .toList(),
                ),
                _buildCategories(context: context, categories: data.categories),
              ],
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Consumer(
            builder: (context, watch, _) {
              final handleTodoListState =
                  watch(handleTodoListStateNotifierProvider);
              return handleTodoListState.map(
                started: (_) => const SizedBox.shrink(),
                listeningCategories: (data) => data.categories.isNotEmpty
                    ? FloatingActionButton(
                        heroTag: Key('add-note'),
                        key: Key('add-note'),
                        backgroundColor: Colors.white,
                        onPressed: () => AutoRouter.of(context).push(
                            CreateTaskRoute(
                                categoriesToSelect: data.categories)),
                        child: Icon(Icons.note_alt),
                      )
                    : const SizedBox.shrink(),
              );
            },
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            heroTag: Key('add-category'),
            key: Key('add-category'),
            backgroundColor: Colors.white,
            onPressed: () => AutoRouter.of(context).push(CreateCategoryRoute()),
            child: Icon(Icons.add_comment),
          ),
        ],
      ),
    );
  }

  Widget _buildTasks({
    required BuildContext context,
    required List<TaskModel> tasks,
  }) {
    final tasksWidget = tasks
        .map<TaskItemWidget>((task) => TaskItemWidget(
              id: task.id,
              categoryId: task.categoryId,
              onCheckTap: () => context
                  .read(handleTodoListStateNotifierProvider.notifier)
                  .updateTask(
                      categoryId: task.categoryId,
                      taskId: task.id,
                      isCompleted: !task.isCompleted),
              groupColor: task.categoryColor,
              decription: task.title,
              isCompleted: task.isCompleted,
            ))
        .toList();
    return SafeArea(
      bottom: false,
      child: MediaQuery.removePadding(
        context: context,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Tasks',
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .apply(color: AppColors.black),
              ),
            ),
            const SizedBox(height: 16),
            if (tasksWidget.isEmpty)
              Text(
                'No tasks created yet',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .apply(color: AppColors.black.withOpacity(0.5)),
              ),
            ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onLongPress: () => context
                      .read(handleTodoListStateNotifierProvider.notifier)
                      .deleteTask(
                        categoryId: tasksWidget[index].categoryId,
                        taskId: tasksWidget[index].id,
                      ),
                  child: tasksWidget[index],
                ),
              ),
              separatorBuilder: (context, index) => const SeparatorWidget(),
              itemCount: tasksWidget.length,
              shrinkWrap: true,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildCategories({
    required BuildContext context,
    required List<CategoryModel> categories,
  }) {
    final categoriesWidget = categories.map<CategoryWidgeet>((category) {
      final theme = CategoryTheme.chooseVariation(category.categoryTheme);
      return CategoryWidgeet(
        id: category.id,
        variation: category.categoryTheme,
        backgroundColor: theme.backgroundColor,
        titleColor: theme.titleColor,
        subtitleColor: theme.subtitleColor,
        title: category.title,
        tasksAmount: category.tasks.length,
      );
    }).toList();
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
            if (categoriesWidget.isEmpty)
              Text(
                'No categories created yet',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .apply(color: AppColors.black.withOpacity(0.5)),
              ),
            MediaQuery.removePadding(
              removeTop: true,
              removeBottom: true,
              context: context,
              child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => GestureDetector(
                  child: categoriesWidget[index],
                  onLongPress: () => context
                      .read(handleTodoListStateNotifierProvider.notifier)
                      .deleteCategory(categoriesWidget[index].id),
                ),
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemCount: categoriesWidget.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
