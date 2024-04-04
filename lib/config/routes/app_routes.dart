import 'package:flutter/material.dart';
import 'package:gallery/core/util/cache_helper.dart';
import 'package:gallery/features/app/presentation/pages/gallery.dart';

import '../../features/auth/presentation/pages/loginScreen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String homeRoute = '/home';
  static const String loginRoute = '/login';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) {
          if (CacheHelper.getData('user') == true) {
            return Login();
          } else {
            return Login();
          }
        });

      case Routes.homeRoute:
        return MaterialPageRoute(builder: (context) => Gallery());

      case Routes.loginRoute:
        return MaterialPageRoute(builder: (context) => Login());
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text('no route'),
        ),
      ),
    );
  }
}
