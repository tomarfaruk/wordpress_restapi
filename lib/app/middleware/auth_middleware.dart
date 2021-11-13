import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mail_api/app/routes/app_pages.dart';
import 'package:mail_api/app/service/local/shared_preference_service.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  int get priority => 2;

  bool get isAuthenticate =>
      SharedPreferenceService.getAccessToken.isEmpty == true ? true : false;

  @override
  RouteSettings? redirect(String? route) {
    if (isAuthenticate == true) {
      return RouteSettings(name: Routes.LOGIN);
    }
  }
}
