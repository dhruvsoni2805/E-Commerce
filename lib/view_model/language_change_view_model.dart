import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageChangeViewModel with ChangeNotifier {
  Locale? _appLocale;
  Locale? get appLocal => _appLocale;

  void changeLanguage(Locale type) async {
    var prefs = await SharedPreferences.getInstance();
    _appLocale = type;

    if (type == const Locale("es")) {
      _appLocale = const Locale("es");
      await prefs.setString('language_code', 'es');
      // await prefs.setString('countryCode', 'es');
    } else {
      _appLocale = const Locale("en");
      await prefs.setString('language_code', 'en');
      // await prefs.setString('countryCode', 'en');
    }
    notifyListeners();
  }
}
