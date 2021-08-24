import 'package:json_annotation/json_annotation.dart';

import 'package:todo_list/app/config/categories/category_theme.dart';
import 'package:todo_list/app/shared/infra/models/task_model.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  final String id;
  final String title;
  final List<TaskModel> tasks;
  final CategoryThemeVariations categoryTheme;

  const CategoryModel({
    required this.title,
    required this.tasks,
    required this.categoryTheme,
    required this.id,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  CategoryModel copyWith({
    String? id,
    String? title,
    List<TaskModel>? tasks,
    CategoryThemeVariations? categoryTheme,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      title: title ?? this.title,
      tasks: tasks ?? this.tasks,
      categoryTheme: categoryTheme ?? this.categoryTheme,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoryModel && other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        tasks.hashCode ^
        categoryTheme.hashCode;
  }
}
