import 'package:auto_route/auto_route.dart';

import 'package:todo_list/app/features/category/pages/create_category_page.dart';
import 'package:todo_list/app/features/home/home_page.dart';

@CupertinoAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
    AutoRoute(page: CreateCategoryPage),
  ],
)
class $AppRouter {}
