import 'package:ecommerce/utils/app_route/route_name.dart';
import 'package:ecommerce/view/home_screeen.dart';
import 'package:ecommerce/view_model/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'utils/app_route/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SplashScreenViewModel(),
        )
      ],
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter E-Commerce',
          theme: ThemeData.light(useMaterial3: true),
          darkTheme: ThemeData.dark(useMaterial3: true),
          themeMode: ThemeMode.system,
          initialRoute: RouteName.splashscreen,
          onGenerateRoute: Routes.generateRoute,
          // home: const HomeScreen(),
        );
      },
    );
  }
}
