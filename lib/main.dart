import 'package:flutter/material.dart';
import 'package:news_application/providers/app_config_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home/home_screen.dart';
import 'home/news/news_details_screen.dart';
import 'l10n/app_localizations.dart';
import 'my_theme_data.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  late AppConfigProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    initSharedPref();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        NewsDetailsScreen.routeName: (context) => NewsDetailsScreen(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
    );
  }

  void initSharedPref() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? language = await pref.getString("language");
    if (language != null) {
      provider.changeLanguage(language);
    }
  }
}
