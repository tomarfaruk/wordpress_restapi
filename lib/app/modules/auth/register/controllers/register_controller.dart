import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mail_api/app/components/loading_progress.dart';  
import 'package:mail_api/app/routes/app_pages.dart'; 
import 'package:mail_api/app/service/network/api_service.dart'; 
import 'package:mail_api/constants/api_urls.dart';

class RegisterController extends GetxController {
  final apiService = ApiService();

  @override
  void onInit() {
    super.onInit();
  }

  RxBool isShowPassword = true.obs;
  RxBool isConShowPassword = true.obs;
  RxBool isDomainLoading = true.obs;
  var currentSelectedDomain = RxString('');

  void passwordChange() {
    isShowPassword.value = !isShowPassword.value;
  }

  void conPasswordChange() {
    isConShowPassword.value = !isConShowPassword.value;
  }

  final formKey = GlobalKey<FormState>();

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<void> registerUser() async {
    Map<String, String> header = {"content-type": "application/json"};
    try {
      final mapBody = {
        "username": fullNameController.text.trim(),
        "email": emailController.text.trim(),
        "password": passwordController.text.trim(),
      };

      myProgressDialog();
      final response = await apiService.post(
          ApiUrls.registration, header, json.encode(mapBody));

      if (Get.isDialogOpen!) Get.back();
      print(response?.body);

      if (response != null && response.statusCode == 200) {
        Get.offNamed(Routes.LOGIN);
        Get.snackbar('Success', 'Registration Success',
            snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
      } else {
        Get.snackbar('Error', 'Registration failed',
            snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
      }
    } catch (e) {
      if (Get.isDialogOpen!) Get.back();
      Get.snackbar('Error', '${e.toString().split(':').last}',
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
  }
}
