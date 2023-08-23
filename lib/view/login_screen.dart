import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../view_model/language_change_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

enum Language { english, spanish }

class _LoginScreenState extends State<LoginScreen> {
  Language? selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(AppLocalizations.of(context)!.signin),
        actions: [
          Consumer<LanguageChangeViewModel>(
            builder: (context, value, child) => PopupMenuButton(
                initialValue: selectedMenu,
                onSelected: (Language item) {
                  if (Language.english.name == item.name) {
                    value.changeLanguage(const Locale('en'));
                  } else {
                    value.changeLanguage(const Locale('es'));
                  }
                },
                itemBuilder: (context) => <PopupMenuEntry<Language>>[
                      const PopupMenuItem(
                          value: Language.english, child: Text("English")),
                      const PopupMenuItem(
                          value: Language.spanish, child: Text("Spanish")),
                    ]),
          )
        ],
      ),
      body: Center(
        child: Text(AppLocalizations.of(context)!.signin),
      ),
    );
  }
}
