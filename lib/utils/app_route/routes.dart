import 'package:ecommerce/utils/app_route/route_name.dart';
import 'package:ecommerce/view/home_screeen.dart';
import 'package:ecommerce/view/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../view/splash_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splashscreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case RouteName.loginscreen:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case RouteName.homescreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) {
            return const Scaffold(
              body: Center(
                child: Text("No Any Route Pages"),
              ),
            );
          },
        );
    }
  }
}
