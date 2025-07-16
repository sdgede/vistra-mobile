import 'package:flutter/material.dart';
import 'package:vistra/res/constants/routers.dart';
import 'package:vistra/routes/auth_router.dart';
import 'package:vistra/routes/home_router.dart';
import 'package:vistra/screens/global/eror_screnn.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    if (settings.name?.startsWith(AppRoutes.auth) ?? false) {
      return AuthRouter.generateRoute(settings);
    } else if (settings.name?.startsWith(AppRoutes.home) ?? false) {
      return HomeRouter.generateRoute(settings);
    }

    return MaterialPageRoute(builder: (context) => const ErrorScreen());
  }
}
