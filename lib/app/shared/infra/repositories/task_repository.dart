import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:sembast/sembast.dart';
import 'package:collection/collection.dart';

import 'package:todo_list/app/shared/infra/failure/task_repository_failure.dart';
import 'package:todo_list/app/shared/infra/models/category_model.dart';
import 'package:todo_list/app/shared/infra/models/task_model.dart';

class TaskRepository {
  final Database _database;
  final StoreRef<String, Map<String, dynamic>> _store;

  const TaskRepository({
    required Database database,
    required StoreRef<String, Map<String, dynamic>> store,
  })  : _database = database,
        _store = store;

  Future<Either<TaskRepositoryFailure, Unit>> create({
    required String categoryId,
    required String taskId,
    required bool isCompleted,
    required String title,
    required Color categoryColor,
  }) async {
    final record = _store.record(categoryId);
    final categoryJson = await record.get(_database);
    if (categoryJson == null) {
      return left(TaskRepositoryFailure.categoryNoExist);
    }
    final category = CategoryModel.fromJson(categoryJson);
    final taskToCreate = TaskModel(
      title: title,
      categoryColor: categoryColor,
      isCompleted: isCompleted,
      id: taskId,
    );
    category.tasks.add(taskToCreate);
    await record.put(_database, category.toJson());
    return right(unit);
  }

  Future<Either<TaskRepositoryFailure, Unit>> delete({
    required String categoryId,
    required String taskId,
  }) async {
    final record = _store.record(categoryId);
    final categoryJson = await record.get(_database);
    if (categoryJson == null) {
      return left(TaskRepositoryFailure.categoryNoExist);
    }
    final category = CategoryModel.fromJson(categoryJson);
    category.tasks.retainWhere((task) => task.id != taskId);
    await record.put(_database, category.toJson());
    return right(unit);
  }

  Future<Either<TaskRepositoryFailure, Unit>> update({
    required String categoryId,
    required String taskId,
    required bool? isCompleted,
    required String? title,
    required Color? categoryColor,
  }) async {
    final record = _store.record(categoryId);
    final categoryJson = await record.get(_database);
    if (categoryJson == null) {
      return left(TaskRepositoryFailure.categoryNoExist);
    }
    final category = CategoryModel.fromJson(categoryJson);
    final task = category.tasks.firstWhereOrNull((task) => task.id == taskId);
    if (task != null) {
      final updatedTask = task.copyWith(
        isCompleted: isCompleted,
        title: title,
        categoryColor: categoryColor,
      );
      final indexOfTask = category.tasks.indexOf(updatedTask);
      if (indexOfTask != -1) {
        category.tasks
            .replaceRange(indexOfTask, indexOfTask + 1, [updatedTask]);
        await record.put(_database, category.toJson());
      }
    }
    return right(unit);
  }
}
