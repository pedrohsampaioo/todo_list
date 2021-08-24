// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'handle_todo_list_state_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HandleTodoListStateTearOff {
  const _$HandleTodoListStateTearOff();

  HandleTodoListStateStarted started() {
    return const HandleTodoListStateStarted();
  }

  HandleTodoListListeningCategories listeningCategories(
      {required List<CategoryModel> categories}) {
    return HandleTodoListListeningCategories(
      categories: categories,
    );
  }
}

/// @nodoc
const $HandleTodoListState = _$HandleTodoListStateTearOff();

/// @nodoc
mixin _$HandleTodoListState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(List<CategoryModel> categories)
        listeningCategories,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(List<CategoryModel> categories)? listeningCategories,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(List<CategoryModel> categories)? listeningCategories,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HandleTodoListStateStarted value) started,
    required TResult Function(HandleTodoListListeningCategories value)
        listeningCategories,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HandleTodoListStateStarted value)? started,
    TResult Function(HandleTodoListListeningCategories value)?
        listeningCategories,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HandleTodoListStateStarted value)? started,
    TResult Function(HandleTodoListListeningCategories value)?
        listeningCategories,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HandleTodoListStateCopyWith<$Res> {
  factory $HandleTodoListStateCopyWith(
          HandleTodoListState value, $Res Function(HandleTodoListState) then) =
      _$HandleTodoListStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$HandleTodoListStateCopyWithImpl<$Res>
    implements $HandleTodoListStateCopyWith<$Res> {
  _$HandleTodoListStateCopyWithImpl(this._value, this._then);

  final HandleTodoListState _value;
  // ignore: unused_field
  final $Res Function(HandleTodoListState) _then;
}

/// @nodoc
abstract class $HandleTodoListStateStartedCopyWith<$Res> {
  factory $HandleTodoListStateStartedCopyWith(HandleTodoListStateStarted value,
          $Res Function(HandleTodoListStateStarted) then) =
      _$HandleTodoListStateStartedCopyWithImpl<$Res>;
}

/// @nodoc
class _$HandleTodoListStateStartedCopyWithImpl<$Res>
    extends _$HandleTodoListStateCopyWithImpl<$Res>
    implements $HandleTodoListStateStartedCopyWith<$Res> {
  _$HandleTodoListStateStartedCopyWithImpl(HandleTodoListStateStarted _value,
      $Res Function(HandleTodoListStateStarted) _then)
      : super(_value, (v) => _then(v as HandleTodoListStateStarted));

  @override
  HandleTodoListStateStarted get _value =>
      super._value as HandleTodoListStateStarted;
}

/// @nodoc

class _$HandleTodoListStateStarted implements HandleTodoListStateStarted {
  const _$HandleTodoListStateStarted();

  @override
  String toString() {
    return 'HandleTodoListState.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is HandleTodoListStateStarted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(List<CategoryModel> categories)
        listeningCategories,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(List<CategoryModel> categories)? listeningCategories,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(List<CategoryModel> categories)? listeningCategories,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HandleTodoListStateStarted value) started,
    required TResult Function(HandleTodoListListeningCategories value)
        listeningCategories,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HandleTodoListStateStarted value)? started,
    TResult Function(HandleTodoListListeningCategories value)?
        listeningCategories,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HandleTodoListStateStarted value)? started,
    TResult Function(HandleTodoListListeningCategories value)?
        listeningCategories,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class HandleTodoListStateStarted implements HandleTodoListState {
  const factory HandleTodoListStateStarted() = _$HandleTodoListStateStarted;
}

/// @nodoc
abstract class $HandleTodoListListeningCategoriesCopyWith<$Res> {
  factory $HandleTodoListListeningCategoriesCopyWith(
          HandleTodoListListeningCategories value,
          $Res Function(HandleTodoListListeningCategories) then) =
      _$HandleTodoListListeningCategoriesCopyWithImpl<$Res>;
  $Res call({List<CategoryModel> categories});
}

/// @nodoc
class _$HandleTodoListListeningCategoriesCopyWithImpl<$Res>
    extends _$HandleTodoListStateCopyWithImpl<$Res>
    implements $HandleTodoListListeningCategoriesCopyWith<$Res> {
  _$HandleTodoListListeningCategoriesCopyWithImpl(
      HandleTodoListListeningCategories _value,
      $Res Function(HandleTodoListListeningCategories) _then)
      : super(_value, (v) => _then(v as HandleTodoListListeningCategories));

  @override
  HandleTodoListListeningCategories get _value =>
      super._value as HandleTodoListListeningCategories;

  @override
  $Res call({
    Object? categories = freezed,
  }) {
    return _then(HandleTodoListListeningCategories(
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
    ));
  }
}

/// @nodoc

class _$HandleTodoListListeningCategories
    implements HandleTodoListListeningCategories {
  const _$HandleTodoListListeningCategories({required this.categories});

  @override
  final List<CategoryModel> categories;

  @override
  String toString() {
    return 'HandleTodoListState.listeningCategories(categories: $categories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is HandleTodoListListeningCategories &&
            (identical(other.categories, categories) ||
                const DeepCollectionEquality()
                    .equals(other.categories, categories)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(categories);

  @JsonKey(ignore: true)
  @override
  $HandleTodoListListeningCategoriesCopyWith<HandleTodoListListeningCategories>
      get copyWith => _$HandleTodoListListeningCategoriesCopyWithImpl<
          HandleTodoListListeningCategories>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(List<CategoryModel> categories)
        listeningCategories,
  }) {
    return listeningCategories(categories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(List<CategoryModel> categories)? listeningCategories,
  }) {
    return listeningCategories?.call(categories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(List<CategoryModel> categories)? listeningCategories,
    required TResult orElse(),
  }) {
    if (listeningCategories != null) {
      return listeningCategories(categories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HandleTodoListStateStarted value) started,
    required TResult Function(HandleTodoListListeningCategories value)
        listeningCategories,
  }) {
    return listeningCategories(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HandleTodoListStateStarted value)? started,
    TResult Function(HandleTodoListListeningCategories value)?
        listeningCategories,
  }) {
    return listeningCategories?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HandleTodoListStateStarted value)? started,
    TResult Function(HandleTodoListListeningCategories value)?
        listeningCategories,
    required TResult orElse(),
  }) {
    if (listeningCategories != null) {
      return listeningCategories(this);
    }
    return orElse();
  }
}

abstract class HandleTodoListListeningCategories
    implements HandleTodoListState {
  const factory HandleTodoListListeningCategories(
          {required List<CategoryModel> categories}) =
      _$HandleTodoListListeningCategories;

  List<CategoryModel> get categories => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HandleTodoListListeningCategoriesCopyWith<HandleTodoListListeningCategories>
      get copyWith => throw _privateConstructorUsedError;
}
