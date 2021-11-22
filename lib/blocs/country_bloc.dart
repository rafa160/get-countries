import 'dart:convert';

import 'package:aidhere_app/models/country_model.dart';
import 'package:aidhere_app/services/countries_service.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/services.dart';

class CountryBloc extends BlocBase {

  List<dynamic> countries = [];
  final CountriesService _countriesService = CountriesService();

  Future<List<CountryModel>> fetch({String value, int index}) async {
    if(value == null) {
      countries = await _countriesService.getCountriesInfo();
      return countries;
    } if(index == 1) {
      countries = await _countriesService.getCountriesInfo(value: value, index: 1);
      return countries;
    } else {

    }

  }

  Future<List<CountryModel>> fetchFromJson() async {
    final String response = await rootBundle.loadString('assets/countries.json');
    final data = await json.decode(response);
    return data.map<CountryModel>((map) {
      var countries = CountryModel.fromJson(map);
      return countries;
    }).toList();
  }

}