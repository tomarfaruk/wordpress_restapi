import 'package:get/get.dart';
import 'package:mail_api/app/middleware/auth_middleware.dart';
import 'package:mail_api/app/modules/auth/login/bindings/login_binding.dart';
import 'package:mail_api/app/modules/auth/login/views/login_view.dart';
import 'package:mail_api/app/modules/auth/register/bindings/register_binding.dart';
import 'package:mail_api/app/modules/auth/register/views/register_view.dart';
import 'package:mail_api/app/modules/home/bindings/home_binding.dart';
import 'package:mail_api/app/modules/home/views/edit_profile_page.dart';
import 'package:mail_api/app/modules/home/views/home_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: _Paths.PROFILE_EDIT,
      page: () => EditProfilePage(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
  ];
}
