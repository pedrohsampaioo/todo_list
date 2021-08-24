// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import 'features/category/pages/create_category_page.dart' as _i4;
import 'features/home/home_page.dart' as _i3;
import 'features/task/pages/create_task_page.dart' as _i5;
import 'shared/infra/models/category_model.dart' as _i6;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) => _i1.CupertinoPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.HomePage();
        }),
    CreateCategoryRoute.name: (routeData) => _i1.CupertinoPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i4.CreateCategoryPage();
        }),
    CreateTaskRoute.name: (routeData) => _i1.CupertinoPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<CreateTaskRouteArgs>();
          return _i5.CreateTaskPage(
              categoriesToSelect: args.categoriesToSelect, key: args.key);
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(HomeRoute.name, path: '/'),
        _i1.RouteConfig(CreateCategoryRoute.name,
            path: '/create-category-page'),
        _i1.RouteConfig(CreateTaskRoute.name, path: '/create-task-page')
      ];
}

class HomeRoute extends _i1.PageRouteInfo {
  const HomeRoute() : super(name, path: '/');

  static const String name = 'HomeRoute';
}

class CreateCategoryRoute extends _i1.PageRouteInfo {
  const CreateCategoryRoute() : super(name, path: '/create-category-page');

  static const String name = 'CreateCategoryRoute';
}

class CreateTaskRoute extends _i1.PageRouteInfo<CreateTaskRouteArgs> {
  CreateTaskRoute(
      {required List<_i6.CategoryModel> categoriesToSelect, _i2.Key? key})
      : super(name,
            path: '/create-task-page',
            args: CreateTaskRouteArgs(
                categoriesToSelect: categoriesToSelect, key: key));

  static const String name = 'CreateTaskRoute';
}

class CreateTaskRouteArgs {
  const CreateTaskRouteArgs({required this.categoriesToSelect, this.key});

  final List<_i6.CategoryModel> categoriesToSelect;

  final _i2.Key? key;
}
