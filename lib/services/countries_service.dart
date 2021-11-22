import 'package:aidhere_app/models/country_model.dart';
import 'package:aidhere_app/networking/web_api_base.dart';
import 'package:aidhere_app/services/country_layer_api.dart';

class CountriesService extends WebApiBase {

  Future<List<CountryModel>> getCountriesInfo({String value, int index}) async {
    if(value == null) {
      var result = await get(
          controller:
          '${CountryLayerApi.version}${CountryLayerApi.allCountries}${CountryLayerApi.access}${CountryLayerApi.key}');
      return result.dataList.map<CountryModel>((map) {
        var countries = CountryModel.fromJson(map);
        return countries;
      }).toList();
    } if(index == 1) {
      var result = await get(
          controller:
          '${CountryLayerApi.version}${CountryLayerApi.regions}$value${CountryLayerApi.access}${CountryLayerApi.key}');
      return result.dataList.map<CountryModel>((map) {
        var countries = CountryModel.fromJson(map);
        return countries;
      }).toList();
    } else {
      var result = await get(
          controller:
          '${CountryLayerApi.version}${CountryLayerApi.name}$value${CountryLayerApi.access}${CountryLayerApi.key}');
      return result.dataList.map<CountryModel>((map) {
        var countries = CountryModel.fromJson(map);
        return countries;
      }).toList();
    }
  }
}