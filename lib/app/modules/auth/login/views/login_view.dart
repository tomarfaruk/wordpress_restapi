import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mail_api/app/components/button.dart';
import 'package:mail_api/app/components/custom_form_field.dart';
import 'package:mail_api/app/modules/auth/components/auth_background.dart';
import 'package:mail_api/app/modules/auth/components/have_an_account_or_not_view.dart';
import 'package:mail_api/app/modules/auth/components/or_sign_with.dart';
import 'package:mail_api/app/modules/auth/components/social_buttons.dart';
import 'package:mail_api/app/modules/auth/login/controllers/login_controller.dart';
import 'package:mail_api/app/routes/app_pages.dart';
import 'package:mail_api/constants/custom_colors.dart';
import 'package:mail_api/constants/strings.dart';

class LoginView extends GetView<LoginController> {
  final TextStyle _textStyle = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontSize: 16.sp,
    height: 1.2,
    letterSpacing: 1.2,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          Strings.singIn,
          textAlign: TextAlign.center,
          style: _textStyle,
        ),
        centerTitle: true,
        backgroundColor: CustomColors.primary,
        elevation: 0,
      ),
      body: AuthBackground(
        body: Form(
          key: controller.formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomFormField(
                title: Strings.enterUserName,
                hintText: Strings.hintUserName,
                icon: Icons.email_outlined,
                keyBoardType: TextInputType.emailAddress,
                controller: controller.emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Enter username';
                  return null;
                },
              ),
              SizedBox(height: 24.h),
              Obx(() => CustomFormField(
                    title: Strings.password,
                    hintText: Strings.hintPassword,
                    icon: Icons.lock_outline,
                    keyBoardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return 'Enter password';
                      return null;
                    },
                    showPassword: controller.isShowPassword.value,
                    controller: controller.passwordController,
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.passwordChange();
                      },
                      icon: Icon(
                        Icons.remove_red_eye_outlined,
                        color: CustomColors.lightBlack,
                      ),
                    ),
                  )),
              SizedBox(height: 24.h),
              Button(
                title: Strings.singIn,
                height: 56.h,
                width: double.infinity,
                onTap: () {
                  final isValid = controller.formKey.currentState!.validate();
                  if (!isValid) {
                    return;
                  }
                  controller.formKey.currentState!.save();
                  FocusScope.of(context).requestFocus(FocusNode());
                  controller.loginUser();
                },
              ),
              SizedBox(height: 24.h),
              HaveAnAccountOrNotView(
                onPressed: () {
                  Get.offAndToNamed(Routes.REGISTER);
                },
                isLogin: true,
              ),
              Spacer(),
              OrSignWith(text: Strings.orSignInWith),
              SizedBox(height: 24.h),
              SocialButtons(),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
