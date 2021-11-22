import 'package:aidhere_app/blocs/country_bloc.dart';
import 'package:aidhere_app/models/country_model.dart';
import 'package:aidhere_app/screens/country_details/country_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';


class CountryDetailsModule extends ModuleWidget {

  final CountryModel countryModel;

  CountryDetailsModule({Key key, this.countryModel}) : super();

  @override
  List<Bloc> get blocs => [];

  @override
  List<Dependency> get dependencies => [
  ];

  @override
  Widget get view => CountryDetailsScreen(countryModel: countryModel,);

  static Inject get to => Inject<CountryDetailsModule>.of();
}