import 'package:flutter/material.dart';

import 'package:todo_list/app/config/theme/app_colors.dart';

class CategoryTheme {
  final Color backgroundColor;
  final Color titleColor;
  final Color subtitleColor;

  const CategoryTheme({
    required this.backgroundColor,
    required this.titleColor,
    required this.subtitleColor,
  });

  static CategoryTheme chooseVariation(CategoryThemeVariations variation) {
    switch (variation) {
      case CategoryThemeVariations.gray:
        return CategoryTheme(
          backgroundColor: AppColors.gray,
          titleColor: AppColors.black,
          subtitleColor: AppColors.black.withOpacity(0.5),
        );
      case CategoryThemeVariations.green:
        return CategoryTheme(
          backgroundColor: AppColors.green,
          titleColor: AppColors.white,
          subtitleColor: AppColors.white.withOpacity(0.5),
        );
      case CategoryThemeVariations.red:
        return CategoryTheme(
          backgroundColor: AppColors.red,
          titleColor: AppColors.white,
          subtitleColor: AppColors.white.withOpacity(0.5),
        );
      case CategoryThemeVariations.yellow:
        return CategoryTheme(
          backgroundColor: AppColors.yellow,
          titleColor: AppColors.black,
          subtitleColor: AppColors.black.withOpacity(0.5),
        );
      case CategoryThemeVariations.purple:
        return CategoryTheme(
          backgroundColor: AppColors.purple,
          titleColor: AppColors.white,
          subtitleColor: AppColors.white.withOpacity(0.5),
        );
    }
  }
}

enum CategoryThemeVariations {
  gray,
  green,
  red,
  yellow,
  purple,
}
