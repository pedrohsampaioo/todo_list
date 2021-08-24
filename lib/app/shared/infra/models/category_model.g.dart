// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      title: json['title'] as String,
      tasks: (json['tasks'] as List<dynamic>)
          .map((e) => TaskModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      categoryTheme:
          _$enumDecode(_$CategoryThemeVariationsEnumMap, json['categoryTheme']),
      id: json['id'] as String,
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'tasks': CategoryModel._toJsonTasks(instance.tasks),
      'categoryTheme': _$CategoryThemeVariationsEnumMap[instance.categoryTheme],
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$CategoryThemeVariationsEnumMap = {
  CategoryThemeVariations.gray: 'gray',
  CategoryThemeVariations.green: 'green',
  CategoryThemeVariations.red: 'red',
  CategoryThemeVariations.yellow: 'yellow',
  CategoryThemeVariations.purple: 'purple',
};
