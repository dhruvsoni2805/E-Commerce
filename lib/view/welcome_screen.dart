import 'package:ecommerce/utils/app_route/route_name.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../view_model/language_change_view_model.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

enum Language { english, spanish }

class _WelcomeScreenState extends State<WelcomeScreen> {
  List lang = ["English", "Spanish"];

  @override
  Widget build(BuildContext context) {
    final dHeight = MediaQuery.of(context).size.height;
    final dWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          Consumer<LanguageChangeViewModel>(builder: (context, value, child) {
            return PopupMenuButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(Localizations.localeOf(context).toString() == "en"
                        ? "English"
                        : "Spanish"),
                    const Icon(Icons.arrow_drop_down)
                  ],
                ),
                onSelected: (Language item) {
                  if (Language.english.name == item.name) {
                    debugPrint(Language.english.name);
                    value.changeLanguage(const Locale('en'));
                  } else {
                    debugPrint(Language.spanish.name);
                    value.changeLanguage(const Locale('es'));
                  }
                },
                itemBuilder: (context) => <PopupMenuEntry<Language>>[
                      const PopupMenuItem(
                          value: Language.english, child: Text("English")),
                      const PopupMenuItem(
                          value: Language.spanish, child: Text("Spanish")),
                    ]);
          }),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Container(
        height: dHeight,
        alignment: Alignment.bottomLeft,
        child: SingleChildScrollView(
          child: Container(
            height: dHeight * 0.3,
            width: dWidth,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50)),
              // color: Colors.teal,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RouteName.loginscreen);
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(dWidth * 0.7, dHeight * 0.07),
                        backgroundColor: Colors.green[400],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    child: Text(AppLocalizations.of(context)!.signin)),
                SizedBox(
                  height: dHeight * 0.05,
                ),
                OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        fixedSize: Size(dWidth * 0.7, dHeight * 0.07),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    child: Text("Sign Up")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
