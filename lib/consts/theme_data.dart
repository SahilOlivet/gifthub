import 'dart:ui';

import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData (bool isDarkTheme, BuildContext context) {
    if (isDarkTheme) { return ThemeData.dark(); }
    else {
      return  ThemeData.light();
    }
    // return ThemeData(

      // scaffoldBackgroundColor: isDarkTheme ? Colors.black :Colors.grey[50],
      // primaryColor: isDarkTheme ? Colors.black : Colors.grey.shade300,
      // backgroundColor: isDarkTheme ? Colors.grey.shade700 : Colors.white,
      // indicatorColor: isDarkTheme ? Color(0xff0E1D36) : Color(0xffCBDCF8),
      // hintColor: isDarkTheme ? Colors.grey.shade300 : Colors.grey.shade800,
      // highlightColor: isDarkTheme ? Color(0xff372901) : Color(0xffffb0a6),
      // hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),
      // focusColor: isDarkTheme ? Color(0xffffffff) : Color(0xffA8DAB5),
      // disabledColor: Colors.grey,
      // cardColor: isDarkTheme ? Color(0xFF151515) : Colors.white,
      // canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      // //brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      // buttonTheme: Theme.of(context).buttonTheme.copyWith(
      //     colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      // appBarTheme:  AppBarTheme(
      //     elevation: 0.0,
      //     color: isDarkTheme ? Colors.black: Colors.white
      // ), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red).copyWith(secondary: Colors.red),
      // textSelectionTheme: TextSelectionThemeData(selectionColor: isDarkTheme ? Colors.white : Colors.black),
    // );

  }
}



/*(
     scaffoldBackgroundColor: isDarkTheme ? Colors.black :Colors.grey[50],
      primaryColor: isDarkTheme ? Colors.black : Colors.grey.shade300,
      backgroundColor: isDarkTheme ? Colors.grey.shade700 : Colors.white,
      indicatorColor: isDarkTheme ? Color(0xff0E1D36) : Color(0xffCBDCF8),
      hintColor: isDarkTheme ? Colors.grey.shade300 : Colors.grey.shade800,
      highlightColor: isDarkTheme ? Color(0xff372901) : Color(0xffffb0a6),
      hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),
      focusColor: isDarkTheme ? Color(0xffffffff) : Color(0xffA8DAB5),
      disabledColor: Colors.grey,
      cardColor: isDarkTheme ? Color(0xFF151515) : Colors.white,
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      //brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      appBarTheme:  AppBarTheme(
        elevation: 0.0,
       color: isDarkTheme ? Colors.black: Colors.white
      ), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red).copyWith(secondary: Colors.red),
      textSelectionTheme: TextSelectionThemeData(selectionColor: isDarkTheme ? Colors.white : Colors.black),
    ); */