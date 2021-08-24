import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list/app/shared/infra/models/task_model.dart';
import 'package:uuid/uuid.dart';

import 'package:todo_list/app/shared/infra/models/category_model.dart';
import 'package:todo_list/app/shared/infra/repositories/category_repository.dart';
import 'package:todo_list/app/shared/infra/repositories/task_repository.dart';
import 'package:todo_list/app/config/categories/category_theme.dart';

part 'handle_todo_list_state.dart';
part 'handle_todo_list_state_notifier.freezed.dart';

class HandleTodoListStateNotifier extends StateNotifier<HandleTodoListState> {
  final CategoryRepository _categoryRepository;
  final TaskRepository _taskRepository;
  HandleTodoListStateNotifier({
    required TaskRepository taskRepository,
    required CategoryRepository categoryRepository,
  })  : _taskRepository = taskRepository,
        _categoryRepository = categoryRepository,
        super(const HandleTodoListState.started());
  late StreamSubscription<List<CategoryModel>> _subscription;

  void init() async {
    state.map(
      started: (_) {
        final categoriesStream = _categoryRepository.getAllCategoriesAsStream();
        _subscription = categoriesStream.listen(
          (categories) {
            state = HandleTodoListState.listeningCategories(
              categories: categories,
            );
          },
        );
      },
      listeningCategories: (_) {},
    );
  }

  Future<void> createCategory({
    required String categoryId,
    required String title,
    required CategoryThemeVariations categoryTheme,
  }) async {
    final categoryId = Uuid().v4();
    await _categoryRepository.createCategory(
      id: categoryId,
      title: title,
      categoryTheme: categoryTheme,
    );
  }

  Future<void> createTask({
    required String categoryId,
    required bool isCompleted,
    required String title,
    required Color categoryColor,
  }) async {
    final taskId = Uuid().v4();
    await _taskRepository.create(
      categoryId: categoryId,
      taskId: taskId,
      isCompleted: isCompleted,
      title: title,
      categoryColor: categoryColor,
    );
  }

  Future<void> deleteCategory(String categoryId) async =>
      await _categoryRepository.deleteCategory(id: categoryId);

  Future<void> deleteTask({
    required String categoryId,
    required String taskId,
  }) async =>
      await _taskRepository.delete(categoryId: categoryId, taskId: taskId);

  Future<void> updateCategory({
    required String categoryId,
    String? title,
    List<TaskModel>? tasks,
    CategoryThemeVariations? categoryTheme,
  }) async =>
      await _categoryRepository.updateCategory(
        id: categoryId,
        title: title,
        tasks: tasks,
        categoryTheme: categoryTheme,
      );

  Future<void> updateTask({
    required String categoryId,
    required String taskId,
    bool? isCompleted,
    String? title,
    Color? categoryColor,
  }) async =>
      await _taskRepository.update(
        categoryId: categoryId,
        taskId: taskId,
        isCompleted: isCompleted,
        title: title,
        categoryColor: categoryColor,
      );

  @override
  void dispose() async {
    _subscription.cancel();
    super.dispose();
  }
}
