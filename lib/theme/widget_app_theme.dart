import 'package:aidhere_app/app_module.dart';
import 'package:flutter/material.dart';
import 'preferences_manager.dart';

typedef ThemedBuilder = Widget Function(BuildContext context, ThemeData data);

typedef ThemeDataWithBrightnessBuilder = ThemeData Function(
    Brightness brightness);

class AppTheme extends StatefulWidget {
  final ThemedBuilder themedBuilder;
  final ThemeDataWithBrightnessBuilder themeDataWithBrightnessBuilder;
  final Brightness defaultBrightness;

  const AppTheme(
      {Key key, this.themeDataWithBrightnessBuilder, this.themedBuilder, this.defaultBrightness})
      : super(key: key);

  @override
  _AppThemeState createState() => _AppThemeState();

  static _AppThemeState of(BuildContext context) {
    return context.findAncestorStateOfType<_AppThemeState>();
  }
}

class _AppThemeState extends State<AppTheme> {
  ThemeData _data;
  Brightness _brightness;

  ThemeData get data => _data;

  Brightness get brightness => _brightness;
  final PreferencesManager _preferencesService = AppModule.to.get();

  @override
  void initState() {
    super.initState();
    _brightness = widget.defaultBrightness;
    _data = widget.themeDataWithBrightnessBuilder(_brightness);

    loadBrightness().then((bool dark) {
      _brightness = dark ? Brightness.dark : Brightness.light;
      _data = widget.themeDataWithBrightnessBuilder(_brightness);
      if (mounted) {
        setState(() {});
      }
    });
  }

  Future<bool> loadBrightness() async {
    return await _preferencesService
        .getBool(PreferencesManager.isThemeDark) ??
        widget.defaultBrightness == Brightness.dark;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _data = widget.themeDataWithBrightnessBuilder(_brightness);
  }

  @override
  void didUpdateWidget(AppTheme oldWidget) {
    super.didUpdateWidget(oldWidget);
    _data = widget.themeDataWithBrightnessBuilder(_brightness);
  }

  Future<void> setBrightness(Brightness brightness) async {
    setState(() {
      _data = widget.themeDataWithBrightnessBuilder(brightness);
      _brightness = brightness;
    });

    await _preferencesService.putBool(PreferencesManager.isThemeDark,
        brightness == Brightness.dark ? true : false);
  }

  void setThemeData(ThemeData data) {
    setState(() {
      _data = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.themedBuilder(context, _data);
  }
}