import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:todo_list/app/shared/infra/repositories/category_repository.dart';
import 'package:todo_list/app/shared/infra/repositories/task_repository.dart';
import 'package:todo_list/app/shared/providers/database.dart';

final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  final database = ref.watch(databaseProvider);
  final store = ref.watch(storeProvider);
  return CategoryRepository(database: database, store: store);
});

final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  final database = ref.watch(databaseProvider);
  final store = ref.watch(storeProvider);
  return TaskRepository(database: database, store: store);
});
