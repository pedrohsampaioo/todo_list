import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:todo_list/app/config/theme/app_colors.dart';
import 'package:todo_list/app/features/home/widgets/category_widget.dart';
import 'package:todo_list/app/shared/widgets/custom_text_field_widget.dart';
import 'package:todo_list/app/config/categories/category_theme.dart';

class CreateCategoryPage extends HookWidget {
  const CreateCategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryNameController = useTextEditingController();
    final selectedThemeValueNotifier = useValueNotifier<CategoryTheme?>(null);
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
                      categoryName: categoryName.text,
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
                  onPressed: () {},
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
    required String categoryName,
    required ValueNotifier<CategoryTheme?> selectedThemeValueNotifier,
  }) {
    final categories = CategoryThemeVariations.values.map<CategoryWidgeet>(
      (categoryTheme) {
        final variation = CategoryTheme.chooseVariation(categoryTheme);
        return CategoryWidgeet(
          variation: variation,
          backgroundColor: variation.backgroundColor,
          titleColor: variation.titleColor,
          subtitleColor: variation.subtitleColor,
          title: categoryName,
          tasksAmount: 0,
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
        ValueListenableBuilder<CategoryTheme?>(
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
                      categories[index].variation,
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
                          child:
                              variationSelected == categories[index].variation
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
