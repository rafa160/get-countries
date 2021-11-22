import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeLight {
  static Color tableTitleColor = const Color(0xff050A30);
  static Color background = const Color(0xffffffff);
  static Color blue6 = const Color(0xff16b9ff);
  static Color blue12 = const Color(0xffA7CCEE);
  static Color blue5 = const Color(0xff0e3251);
  static Color red1 = const Color(0xffC43131);

  static AppBarTheme createAppBarTheme() {
    return AppBarTheme(
        color: background,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        elevation: 3,
        toolbarTextStyle: TextStyle(color: tableTitleColor,fontSize: 12),
        titleTextStyle: TextStyle(color: tableTitleColor,fontSize: 16),
        actionsIconTheme: IconThemeData(color: tableTitleColor),
        iconTheme: IconThemeData(color: tableTitleColor));
  }

  static ThemeData themeLight = ThemeData(
    brightness: Brightness.light,
    appBarTheme: createAppBarTheme(),
    backgroundColor: background,
    dividerColor: blue6,
    errorColor: red1,
    primaryColor: background,
    primaryColorLight: blue5,
    scaffoldBackgroundColor: background,
    iconTheme: IconThemeData(
      color: blue5,
      opacity: 1,
      size: 24,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: tableTitleColor,
    ),
  );
}