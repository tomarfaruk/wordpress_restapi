import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mail_api/app/modules/auth/login/controllers/login_controller.dart';
import 'package:mail_api/app/modules/home/controllers/home_controller.dart';
import 'package:mail_api/app/routes/app_pages.dart';

class HomeView extends GetView<HomeController> {
  final authController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                if (!controller.isLoading.value)
                  Get.toNamed(Routes.PROFILE_EDIT);
              },
              icon: Icon(Icons.edit)),
          IconButton(
              onPressed: () {
                authController.logOut();
              },
              icon: Icon(Icons.power_settings_new)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RefreshIndicator(
          onRefresh: controller.getUserInfo,
          child: Obx(() => controller.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : loadedBody()),
        ),
      ),
    );
  }

  Widget loadedBody() {
    if (controller.errorMessage.value.isNotEmpty) {
      return ListView(
        children: [
          SizedBox(height: 50),
          Text(controller.errorMessage.value),
        ],
      );
    } else {
      var user = controller.userinfo.value;
      return ListView(
        children: [
          SizedBox(height: 20),
          Text("User uid: ${user.id}"),
          Text("Name: ${user.name}"),
          Text("Fast Name: ${user.firstName}"),
          Text("Last Name: ${user.lastName}"),
          Text("Email: ${user.email}"),
          Text("Username: ${user.username}"),
          Text("Nickname: ${user.nickname}"),
          Text("registered Date: ${user.registeredDate}"),
          SizedBox(height: 8),
          Text("description: ${user.description}"),
          SizedBox(height: 8),
          Text("Your avatar"),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              user.avatarUrls!['96']!,
              fit: BoxFit.contain,
            ),
          ),
        ],
      );
    }
  }
}
