import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorage {
  LocalStorage._();

  static Future<String?> fetchString({required String key}) async {
    var _preferences = await SharedPreferences.getInstance();
    return _preferences.getString(key);
  }

  static Future<void> setString({required String key, required String value}) async {
    var _preferences = await SharedPreferences.getInstance();
    await _preferences.setString(key, value);
  }
}
