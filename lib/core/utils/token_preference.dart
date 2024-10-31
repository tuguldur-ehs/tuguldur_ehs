import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class TokenPreference {
  static SharedPreferences? _preferences;
  static const _userKey = "userID";
  static const _key = 'token';

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future setToken(String token) async {
    await _preferences?.setString(_key, token);
  }

  static String? getToken() => _preferences?.getString(_key);

  static Future setUserId(String id) async =>
      await _preferences?.setString(_userKey, id);

  static String? getUserId() => _preferences?.getString(_userKey);
}
