import 'package:flutter/material.dart';

import '../pages/deleted_tasks_page.dart';
import '../pages/home_page.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    Widget page;

    switch (settings.name) {
      case '/':
        page = const HomePage();
        break;
      case DeletedTasksPage.routeName:
        page = const DeletedTasksPage();
        break;
      default:
        page = const HomePage();
    }

    return MaterialPageRoute(builder: (context) => page);
  }
}
