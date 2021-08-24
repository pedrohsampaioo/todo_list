import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task_model.g.dart';

@JsonSerializable()
class TaskModel {
  final String id;
  final String categoryId;
  final bool isCompleted;
  final String title;
  @JsonKey(fromJson: _fromJsonColor, toJson: _toJsonColor)
  final Color categoryColor;

  const TaskModel({
    required this.id,
    required this.categoryId,
    required this.isCompleted,
    required this.title,
    required this.categoryColor,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);
  Map<String, dynamic> toJson() => _$TaskModelToJson(this);

  static Color _fromJsonColor(Map<String, dynamic> json) =>
      Color(json['categoryColor'] as int);
  static int _toJsonColor(Color categoryColor) => categoryColor.value;

  TaskModel copyWith({
    String? id,
    String? categoryId,
    bool? isCompleted,
    String? title,
    Color? categoryColor,
  }) {
    return TaskModel(
      categoryId: categoryId ?? this.categoryId,
      id: id ?? this.id,
      isCompleted: isCompleted ?? this.isCompleted,
      title: title ?? this.title,
      categoryColor: categoryColor ?? this.categoryColor,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TaskModel && other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        isCompleted.hashCode ^
        title.hashCode ^
        categoryColor.hashCode;
  }
}
