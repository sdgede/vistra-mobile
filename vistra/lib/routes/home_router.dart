import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vistra/res/constants/routers.dart';
import 'package:vistra/screens/global/eror_screnn.dart';
import 'package:vistra/screens/home_page_screen.dart';

class HomeRouter {
  static const String home = AppRoutes.home;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (context) => HomePageScreen());
      default:
        return MaterialPageRoute(builder: (context) => const ErrorScreen());
    }
  }
}
