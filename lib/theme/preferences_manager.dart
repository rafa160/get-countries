import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManager {

  static String isThemeDark = "isThemeDark";


  Completer<SharedPreferences> instance = Completer<SharedPreferences>();

  PreferencesManager() {
    _initLocalStorage();
  }

  _initLocalStorage() async {
    SharedPreferences share = await SharedPreferences.getInstance();
    if (!instance.isCompleted) instance.complete(share);
  }

  Future<bool> putBool(String key, bool value) async {
    try {
      SharedPreferences share = await instance.future;
      share.setBool(key, value);
      return true;
    } catch (e) {
      return false;
    }
  }


  Future<bool> getBool(String key) async {
    try {
      SharedPreferences share = await instance.future;
      bool value = share.getBool(key);
      return value;
    } catch (e) {
      return false;
    }
  }
}