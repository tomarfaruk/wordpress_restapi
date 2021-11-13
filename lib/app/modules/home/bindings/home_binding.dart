import 'package:get/get.dart';
import 'package:mail_api/app/modules/auth/login/controllers/login_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController(), permanent: true);
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
