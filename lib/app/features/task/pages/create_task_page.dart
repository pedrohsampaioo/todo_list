import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:todo_list/app/config/theme/app_colors.dart';
import 'package:todo_list/app/features/home/widgets/category_widget.dart';
import 'package:todo_list/app/shared/infra/models/category_model.dart';
import 'package:todo_list/app/shared/providers/notifiers.dart';
import 'package:todo_list/app/shared/widgets/custom_text_field_widget.dart';
import 'package:todo_list/app/config/categories/category_theme.dart';

class CreateTaskPage extends HookWidget {
  final List<CategoryModel> categoriesToSelect;
  const CreateTaskPage({
    required this.categoriesToSelect,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryNameController = useTextEditingController();
    final selectedThemeValueNotifier = useValueNotifier<CategoryModel?>(null);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'What name do you want?',
                          textAlign: TextAlign.start,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .apply(color: AppColors.black),
                        ),
                      ),
                      const SizedBox(width: 16),
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(
                          Icons.close,
                          color: AppColors.black,
                          size: 32,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomTextFieldWidget(
                    placeholder: 'Category name',
                    autofocus: true,
                    controller: categoryNameController,
                  ),
                ),
                const SizedBox(height: 24),
                ValueListenableBuilder<TextEditingValue>(
                  valueListenable: categoryNameController,
                  builder: (context, categoryName, _) {
                    return _buildSelectTheme(
                      context: context,
                      categoriesToSelect: categoriesToSelect,
                      selectedThemeValueNotifier: selectedThemeValueNotifier,
                    );
                  },
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: AnimatedBuilder(
        builder: (context, _) => AnimatedSwitcher(
          transitionBuilder: (widget, animation) => ScaleTransition(
            scale: animation,
            child: widget,
          ),
          duration: const Duration(milliseconds: 300),
          reverseDuration: const Duration(milliseconds: 300),
          child: categoryNameController.value.text.isNotEmpty &&
                  selectedThemeValueNotifier.value != null
              ? FloatingActionButton(
                  heroTag: Key('add-task-page'),
                  key: Key('add-task-page'),
                  onPressed: () => context
                      .read(handleTodoListStateNotifierProvider.notifier)
                      .createTask(
                        title: categoryNameController.value.text,
                        categoryColor: CategoryTheme.chooseVariation(
                                selectedThemeValueNotifier.value!.categoryTheme)
                            .backgroundColor,
                        categoryId: selectedThemeValueNotifier.value!.id,
                        isCompleted: false,
                      )
                      .whenComplete(() => Navigator.of(context).pop()),
                  child: Icon(
                    Icons.create,
                    size: 24,
                  ),
                  backgroundColor: Colors.white,
                )
              : const SizedBox.shrink(),
        ),
        animation: Listenable.merge([
          categoryNameController,
          selectedThemeValueNotifier,
        ]),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }

  Widget _buildSelectTheme({
    required BuildContext context,
    required List<CategoryModel> categoriesToSelect,
    required ValueNotifier<CategoryModel?> selectedThemeValueNotifier,
  }) {
    final categories = categoriesToSelect.map<CategoryWidgeet>(
      (category) {
        final variation = CategoryTheme.chooseVariation(category.categoryTheme);
        return CategoryWidgeet(
          model: category,
          id: category.id,
          variation: category.categoryTheme,
          backgroundColor: variation.backgroundColor,
          titleColor: variation.titleColor,
          subtitleColor: variation.subtitleColor,
          title: category.title,
          tasksAmount: category.tasks.length,
        );
      },
    ).toList();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Select a theme',
            textAlign: TextAlign.start,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .headline3!
                .apply(color: AppColors.black),
          ),
        ),
        const SizedBox(height: 32),
        if (categories.isEmpty)
          Text(
            'No categories created yet',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .apply(color: AppColors.black.withOpacity(0.5)),
          ),
        ValueListenableBuilder<CategoryModel?>(
          valueListenable: selectedThemeValueNotifier,
          builder: (context, variationSelected, _) {
            return MediaQuery.removePadding(
              removeTop: true,
              removeBottom: true,
              context: context,
              child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                shrinkWrap: true,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => selectedThemeValueNotifier.value =
                      categories[index].model,
                  child: Stack(
                    children: [
                      categories[index],
                      Positioned.fill(
                        right: 16,
                        top: 16,
                        bottom: 16,
                        child: AnimatedSwitcher(
                          transitionBuilder: (widget, animation) =>
                              ScaleTransition(
                            scale: animation,
                            child: widget,
                          ),
                          duration: const Duration(milliseconds: 300),
                          reverseDuration: const Duration(milliseconds: 300),
                          child: variationSelected == categories[index].model
                              ? Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    height: 32,
                                    width: 32,
                                    child: Icon(Icons.check,
                                        size: 24, color: Colors.black),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ),
                      ),
                    ],
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemCount: categories.length,
              ),
            );
          },
        ),
      ],
    );
  }
}
