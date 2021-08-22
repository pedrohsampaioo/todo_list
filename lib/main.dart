import 'package:flutter/material.dart';

import 'app/auto_route_config.gr.dart';
import 'app/config/theme/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      title: 'Todo list',
      theme: AppTheme.configured(context),
    );
  }
}
