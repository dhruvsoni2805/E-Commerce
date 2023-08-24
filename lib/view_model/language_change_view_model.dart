import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageChangeViewModel with ChangeNotifier {
  Locale? _appLocale;
  Locale? get appLocal => _appLocale;

  String? _langName;
  String? get langName => _langName;

  void changeLanguage(Locale type) async {
    var prefs = await SharedPreferences.getInstance();
    _appLocale = type;
    if (type == const Locale("es")) {
      _appLocale = const Locale("es");
      await prefs.setString('language_code', 'es');
      _langName = prefs.getString('language_code');
      debugPrint("ES : $_langName");
    } else {
      _appLocale = const Locale("en");
      await prefs.setString('language_code', 'en');
      _langName = prefs.getString('language_code');
      debugPrint("EN : $_langName");
    }
    notifyListeners();
  }

  //
  void getLanguage() async {
    var prefs = await SharedPreferences.getInstance();
    _langName = prefs.getString('language_code');
    notifyListeners();
  }
}
