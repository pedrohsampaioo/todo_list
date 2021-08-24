import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:todo_list/app/shared/notifiers/handle_todo_list/handle_todo_list_state_notifier.dart';
import 'package:todo_list/app/shared/providers/repositories.dart';

final handleTodoListStateNotifierProvider =
    StateNotifierProvider<HandleTodoListStateNotifier, HandleTodoListState>(
        (ref) {
  final taskRepository = ref.watch(taskRepositoryProvider);
  final categoryRepository = ref.watch(categoryRepositoryProvider);
  return HandleTodoListStateNotifier(
    categoryRepository: categoryRepository,
    taskRepository: taskRepository,
  );
});
