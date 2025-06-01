import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier {
  /// data
  String appLanguage = "en";

  void changeLanguage(String newLanguage) async {
    if (appLanguage == newLanguage) {
      // comparison operator
      return;
    }
    appLanguage = newLanguage;
    notifyListeners();
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("language", appLanguage);
  }
}
