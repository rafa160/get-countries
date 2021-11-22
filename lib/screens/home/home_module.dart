import 'package:aidhere_app/blocs/country_bloc.dart';
import 'package:aidhere_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';


class HomeModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
    Bloc((i) => CountryBloc()),
  ];

  @override
  List<Dependency> get dependencies => [
  ];

  @override
  Widget get view => const HomeScreen();

  static Inject get to => Inject<HomeModule>.of();
}