import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mail_api/app/components/loading_progress.dart';
import 'package:mail_api/app/response_model/login_response_model.dart';
import 'package:mail_api/app/routes/app_pages.dart';
import 'package:mail_api/app/service/network/api_service.dart';
import 'package:mail_api/constants/api_urls.dart';
import 'package:mail_api/app/service/local/shared_preference_service.dart';

class LoginController extends GetxController {
  final apiService = ApiService();

  RxBool isShowPassword = true.obs;

  void passwordChange() {
    isShowPassword.value = !isShowPassword.value;
  }

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> loginUser() async {
    final header = {'Content-Type': 'application/x-www-form-urlencoded'};
    try {
      print('Login API Call');

      final mapBody = {
        "username": emailController.text,
        "password": passwordController.text,
      };

      myProgressDialog();
      final response = await apiService.post(ApiUrls.login, header, mapBody);

      if (Get.isDialogOpen!) Get.back();

      if (response != null) {
        var model = activitySellProductResponseFromJson(response.body);
        print(model);
        print(model.token);
        if (model.token.isNotEmpty) {
          await SharedPreferenceService.setAccessToken(model.token);
          Get.offAndToNamed(Routes.HOME);
        }
      }
    } catch (e) {
      print(e);
      if (Get.isDialogOpen!) Get.back();
      Get.snackbar(
        'Error',
        '${e.toString().split(':').last}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
      );
    }
  }

  Future<void> logOut() async {
    print('logout API Call');
    SharedPreferenceService.logout();
    Get.offAndToNamed(Routes.LOGIN);
  }
}
