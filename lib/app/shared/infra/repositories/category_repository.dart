import 'package:dartz/dartz.dart';
import 'package:sembast/sembast.dart';

import 'package:todo_list/app/config/categories/category_theme.dart';
import 'package:todo_list/app/shared/infra/failure/update_category_failure.dart';
import 'package:todo_list/app/shared/infra/models/category_model.dart';
import 'package:todo_list/app/shared/infra/models/task_model.dart';

class CategoryRepository {
  final Database _database;
  final StoreRef<String, Map<String, dynamic>> _store;

  const CategoryRepository({
    required Database database,
    required StoreRef<String, Map<String, dynamic>> store,
  })  : _database = database,
        _store = store;

  Future<CategoryModel> createCategory({
    required String id,
    required String title,
    required CategoryThemeVariations categoryTheme,
  }) async {
    final category = CategoryModel(
      categoryTheme: categoryTheme,
      title: title,
      id: id,
      tasks: [],
    );
    await _store.record(id).put(_database, category.toJson());
    return category;
  }

  Future<Either<UpdateCategoryFailure, CategoryModel>> updateCategory({
    required String id,
    String? title,
    List<TaskModel>? tasks,
    CategoryThemeVariations? categoryTheme,
  }) async {
    final categoryToUpdate = await _store.record(id).get(_database);
    if (categoryToUpdate == null) {
      return left(UpdateCategoryFailure.uncreatedCategory);
    }
    final updatedCategory = CategoryModel.fromJson(categoryToUpdate).copyWith(
      id: id,
      title: title,
      tasks: tasks,
      categoryTheme: categoryTheme,
    );
    await _store.record(id).put(_database, updatedCategory.toJson());
    return right(updatedCategory);
  }

  Future<void> deleteCategory({required String id}) async {
    await _store.record(id).delete(_database);
  }

  Stream<List<CategoryModel>> getAllCategoriesAsStream() => _store
      .find(_database)
      .asStream()
      .map<List<CategoryModel>>((records) => records
          .map<CategoryModel>((record) => CategoryModel.fromJson(record.value))
          .toList());
}
