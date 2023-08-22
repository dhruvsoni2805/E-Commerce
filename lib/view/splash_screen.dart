import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import '../view_model/splash_view_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashScreenViewModel splashScreenViewModel = SplashScreenViewModel();

  @override
  void initState() {
    // TODO: implement initState
    splashScreenViewModel.checkauthenticate(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
            child: Text(
      "Welcome Back",
      style: TextStyle(fontSize: 25),
    )));
  }
}
