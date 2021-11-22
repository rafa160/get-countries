import 'dart:convert';

import 'package:aidhere_app/models/api_model.dart';
import 'package:aidhere_app/services/country_layer_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class WebApiBase {

  ///
  /// Using the an Api Model and this Class
  ///  you can easily call on you bloc or service.
  ///
  static final Dio _httpClient = Dio();
  static final String countryApi = CountryLayerApi.countryLayerApi;
  Future<ApiModel> get({
    @required String controller,
    Map<String, dynamic> queryParameters,
  }) async {
    try {
      Map<String, String> headers = {
        ///if I decided to use the headers I pass it for here
        'Content-type': 'application/json',
        'Accept': 'application/json'
      };

      final response = await _httpClient.get(
        countryApi + controller,
        queryParameters: queryParameters,
        options: Options(
          contentType: "application/json",
          headers: headers,
        ),
      );


      return ApiModel.fromJson(response.data);
    } on DioError catch (error) {
      if (error.response != null) {
        var erros = await ApiModel().fromJsonAsync(error.response.data);
        return erros;
      } else {

        return ApiModel(success: false, errors: []);
      }
    } catch (error) {
      if (error.response == null) return ApiModel(success: false, errors: []);
      return await ApiModel().fromJsonAsync(error.response.data);
    }
  }

}