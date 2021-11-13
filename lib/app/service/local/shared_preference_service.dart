import 'dart:convert';

import 'package:get/get.dart';
import 'package:mail_api/app/response_model/user_response_model.dart';
import 'package:mail_api/constants/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  static final _preferences = Get.find<SharedPreferences>();

  static bool getOnBoarding() {
    final isOnBoarding = _preferences.getBool(Strings.isFastLoading) ?? false;
    if (!isOnBoarding) _preferences.setBool(Strings.isFastLoading, true);
    return isOnBoarding;
  }

  static String get getAccessToken =>
      _preferences.getString(Strings.accessToken) ?? '';

  static Future<void> setAccessToken(String accessToken) async {
    _preferences.setString(Strings.accessToken, accessToken);
  }

  static Future<void> setLoginInformation(UserResponseModel profile) async {
    _preferences.setString(Strings.profile, json.encode(profile));
  }

  static String getLoginInformation() {
    return _preferences.getString(Strings.profile) ?? '';
  }

  static Future<void> logout() async {
    await _preferences.clear();
    getOnBoarding();
  }
}
