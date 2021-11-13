import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mail_api/constants/custom_colors.dart';

class CustomFormField extends StatelessWidget {
  final String title;
  final String hintText;
  final bool? showPassword;
  final IconData? icon;
  final TextInputType? keyBoardType;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? minLines;
  const CustomFormField({
    Key? key,
    required this.title,
    required this.hintText,
    required this.icon,
    this.validator,
    this.controller,
    this.showPassword = false,
    this.keyBoardType,
    this.suffixIcon,
    this.maxLines = 1,
    this.minLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
            color: CustomColors.deepGray,
            fontFamily: 'Poppins',
            fontStyle: FontStyle.normal,
            height: 1.2,
            letterSpacing: 1.2,
          ),
        ),
        SizedBox(height: 19.h),
        TextFormField(
          validator: validator,
          controller: controller,
          cursorColor: CustomColors.gray,
          maxLines: maxLines,
          minLines: minLines,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: CustomColors.gray,
                letterSpacing: 1,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600,
              ),
          obscureText: showPassword!,
          keyboardType: keyBoardType,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.black38),
            filled: false,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: CustomColors.deepGray),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: CustomColors.deepGray),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: CustomColors.gray),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            prefixIcon: Icon(icon, color: CustomColors.gray),
          ),
        ),
      ],
    );
  }
}
