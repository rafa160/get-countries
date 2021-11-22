import 'package:aidhere_app/theme/preferences_manager.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

import 'package:flutter/material.dart';

import 'app_widget.dart';


class AppModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
  ];

  @override
  List<Dependency> get dependencies => [
    Dependency((i) => PreferencesManager()),
  ];

  @override
  Widget get view => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}