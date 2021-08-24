part of 'handle_todo_list_state_notifier.dart';

@freezed
abstract class HandleTodoListState with _$HandleTodoListState {
  const factory HandleTodoListState.started() = HandleTodoListStateStarted;
  const factory HandleTodoListState.listeningCategories({
    required List<CategoryModel> categories,
  }) = HandleTodoListListeningCategories;
}
