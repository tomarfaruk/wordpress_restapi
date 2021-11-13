import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mail_api/app/components/loading_progress.dart';
import 'package:mail_api/app/response_model/user_response_model.dart';
import 'package:mail_api/app/service/local/shared_preference_service.dart';
import 'package:mail_api/app/service/network/api_service.dart';
import 'package:mail_api/constants/api_urls.dart';

class HomeController extends GetxController {
  final apiService = ApiService();

  // RxInt currentIndex = 0.obs;
  var userinfo = UserResponseModel().obs;
  var errorMessage = ''.obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    final info = SharedPreferenceService.getLoginInformation();
    if (info.isNotEmpty)
      userinfo.value = UserResponseModel.fromJson(json.decode(info));
  }

  @override
  void onReady() {
    super.onReady();
    getUserInfo();
  }

  Future getUserInfo() async {
    errorMessage('');
    isLoading(true);
    final header = {
      'Authorization': 'Bearer ${SharedPreferenceService.getAccessToken}',
      'Content-Type': 'application/json'
    };
    try {
      final response = await apiService.get(ApiUrls.userDetails, header);

      if (response == null) {
        errorMessage("some error try again");
        return;
      }

      var model = userResponseModelFromJson(response.body);
      userinfo(model);
    } catch (e) {
      print(e);
      errorMessage(e.toString().split(':').last);
      if (Get.isDialogOpen!) Get.back();
      Get.snackbar(
        'Error',
        errorMessage.value,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
      );
    }
    isLoading(false);
  }

  Future<void> userUpdate(var body) async {
    final header = {
      'Authorization': 'Bearer ${SharedPreferenceService.getAccessToken}',
      'Content-Type': 'application/json'
    };
    try {
      myProgressDialog();
      final response = await apiService.post(ApiUrls.userUpdate, header, body);

      if (Get.isDialogOpen!) Get.back();
      if (response == null) return;

      if (response.statusCode == 200) {
        var model = userResponseModelFromJson(response.body);
        userinfo(model);
        Get.back();
      } else {
        Get.snackbar(
          'Error',
          'Some error, try again',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
        );
      }
    } catch (e) {
      print(e);
      if (Get.isDialogOpen!) Get.back();
      Get.snackbar(
        'Error',
        e.toString().split(':').last,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
      );
    }
  }
}
