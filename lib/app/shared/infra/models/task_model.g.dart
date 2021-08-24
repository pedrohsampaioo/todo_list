// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) => TaskModel(
      id: json['id'] as String,
      categoryId: json['categoryId'] as String,
      isCompleted: json['isCompleted'] as bool,
      title: json['title'] as String,
      categoryColor: TaskModel._fromJsonColor(
          json['categoryColor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TaskModelToJson(TaskModel instance) => <String, dynamic>{
      'id': instance.id,
      'categoryId': instance.categoryId,
      'isCompleted': instance.isCompleted,
      'title': instance.title,
      'categoryColor': TaskModel._toJsonColor(instance.categoryColor),
    };
