
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeDark {
  static Color tableTitleColor = const Color(0xff434343);
  static Color background =  const Color(0xff434343);
  static Color blue6 = const Color(0xff16b9ff);
  static Color buttonDark = Colors.deepPurpleAccent;
  static Color blue12 = const Color(0xffA7CCEE);
  static Color white = const Color(0xffffffff);
  static Color red1 = const Color(0xffC43131);

  static AppBarTheme createAppBarTheme() {
    return AppBarTheme(
        color: background,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        elevation: 3,
        toolbarTextStyle: TextStyle(color: white,fontSize: 12),
        titleTextStyle: TextStyle(color: white, fontSize: 16),
        actionsIconTheme: IconThemeData(color: white),
        iconTheme: IconThemeData(color: white));
  }

  /// here u can add the theme colors for almost everything.
  static ThemeData themeDark = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: createAppBarTheme(),
    backgroundColor: background,
    dividerColor: white,
    errorColor: red1,
    primaryColor: background,
    primaryColorLight: background,
    scaffoldBackgroundColor: background,
    iconTheme: IconThemeData(
      color: white,
      opacity: 1,
      size: 24,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: white
    ),
  );
}