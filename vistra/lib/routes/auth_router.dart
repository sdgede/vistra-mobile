import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vistra/res/constants/routers.dart';
import 'package:vistra/screens/auth/auth_opotions_screen.dart';
import 'package:vistra/screens/auth/sing_up_screen.dart';
import 'package:vistra/screens/auth/splash_screen.dart';
import 'package:vistra/screens/global/eror_screnn.dart';

class AuthRouter {
  static const String splashScreen = '${AppRoutes.auth}/splash';
  static const String landingScreen = '${AppRoutes.auth}/landing';
  static const String loginScreen = '${AppRoutes.auth}/login';
  static const String registrationScreen = '${AppRoutes.auth}/registration';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case landingScreen:
        return MaterialPageRoute(builder: (context) => AuthOptions());
      case loginScreen:
        return MaterialPageRoute(builder: (context) => AuthOptions());
      case registrationScreen:
        return MaterialPageRoute(builder: (context) => SignUpScreen());
      default:
        return MaterialPageRoute(builder: (context) => const ErrorScreen());
    }
  }
}
