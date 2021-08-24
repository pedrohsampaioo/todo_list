import 'package:auto_route/auto_route.dart';

import 'package:todo_list/app/features/category/pages/create_category_page.dart';
import 'package:todo_list/app/features/home/home_page.dart';
import 'package:todo_list/app/features/task/pages/create_task_page.dart';

@CupertinoAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
    AutoRoute(page: CreateCategoryPage),
    AutoRoute(page: CreateTaskPage),
  ],
)
class $AppRouter {}
