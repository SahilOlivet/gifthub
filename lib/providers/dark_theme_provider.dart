
import 'package:flutter/material.dart';
import 'package:gifts_hub/sharedpreferences/dark_theme_preferences.dart';

class DarkThemeProvider with ChangeNotifier{
 DarkThemePreferences darkThemePreferences = DarkThemePreferences();
  bool _darkTheme = false ;
  bool get darkTheme=>_darkTheme;

  set darkTheme (bool value){
    _darkTheme = value;
    darkThemePreferences.setDarkTheme(value);
    notifyListeners();
    print('theme set fxn is also called');
  }
}