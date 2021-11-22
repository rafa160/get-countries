import 'package:aidhere_app/models/country_model.dart';
import 'package:aidhere_app/services/countries_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/rxdart.dart';

class MockApiCallService extends Mock implements CountriesService {}

main() {
  MockApiCallService mockApiCallService;
  PublishSubject<List<CountryModel>> syncCoinStreamController;

  setUp((){
    mockApiCallService = MockApiCallService();
    syncCoinStreamController = PublishSubject<List<CountryModel>>();
  });

  tearDown(() {
    syncCoinStreamController.close();
  });

  group('api test', () {
    final jsonMap = {
      "data": [
        {
          "name": "Brazil",
          "capital": "Brasilia",
          "region": "Americas",
        }
      ]
    };

    test('Check if returns the Coin List', () async {
      print("You have enter in the test\n");
      final httpResponse = Response(data: jsonMap, statusCode: 200);
      final list = (httpResponse.data['data']).map((e) => CountryModel.fromJson(e)).toList();
      List<CountryModel> expected = list;

      when(mockApiCallService.getCountriesInfo()).thenAnswer((_) async => list);

      expect(expected, list);
      print("You have pass the test");
    });
  });
}