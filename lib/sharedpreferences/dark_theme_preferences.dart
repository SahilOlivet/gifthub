import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePreferences {
  static const THEME_STATUS = "THEMESTATUS";

  setDarkTheme (bool value ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(THEME_STATUS, value);
  }
  Future <bool> getTheme() async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getBool(THEME_STATUS));
    return prefs.getBool(THEME_STATUS, ) ?? false;
  }
}