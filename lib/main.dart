import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ecommerce/utils/app_route/route_name.dart';
import 'package:ecommerce/view_model/splash_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'utils/app_route/routes.dart';
import 'view_model/language_change_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final pref = await SharedPreferences.getInstance();
  final String languageCode = pref.getString('language_code') ?? '';
  runApp(MyApp(
    locale: languageCode,
  ));
}

class MyApp extends StatelessWidget {
  final String locale;
  const MyApp({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LanguageChangeViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => SplashScreenViewModel(),
        )
      ],
      builder: (context, child) {
        return Consumer<LanguageChangeViewModel>(
          builder: (context, value, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter E-Commerce',
              locale: locale == ""
                  ? const Locale('en')
                  : value.appLocal == null
                      ? Locale(locale)
                      : Provider.of<LanguageChangeViewModel>(context).appLocal,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en'), // English
                Locale('es'), // Spanish
              ],
              theme: ThemeData.light(useMaterial3: true),
              darkTheme: ThemeData.dark(useMaterial3: true),
              themeMode: ThemeMode.system,
              initialRoute: RouteName.splashscreen,
              onGenerateRoute: Routes.generateRoute,
              // home: const HomeScreen(),
            );
          },
        );
      },
    );
  }
}
