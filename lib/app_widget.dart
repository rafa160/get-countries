
import 'package:aidhere_app/screens/home/home_module.dart';
import 'package:aidhere_app/theme/dark_theme.dart';
import 'package:aidhere_app/theme/light_theme.dart';
import 'package:aidhere_app/theme/widget_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppTheme(
        defaultBrightness: Brightness.dark,
        themeDataWithBrightnessBuilder: (brightness) =>
        brightness == Brightness.light
            ? ThemeLight.themeLight
            : ThemeDark.themeDark,
        themedBuilder: (context, theme) {
          return GetMaterialApp(
            theme: theme,
            debugShowCheckedModeBanner: false,
            home: HomeModule(),
          );
        });
  }
}