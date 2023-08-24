import 'package:ecommerce/utils/app_route/route_name.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreenViewModel with ChangeNotifier {
  void checkauthenticate(context) {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.pushReplacementNamed(context, RouteName.welcomescreen);
      // notifyListeners();
    });
  }
}
