import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mail_api/constants/custom_colors.dart';

class AuthBackground extends StatelessWidget {
  final Widget body;

  const AuthBackground({
    Key? key,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.primary,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 80),
            decoration: BoxDecoration(
              color: CustomColors.softGray,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
          ),
          Positioned(
            top: 30.h,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 100.h,
                width: 100.w,
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                decoration: BoxDecoration(
                  color: CustomColors.white,
                  borderRadius: BorderRadius.circular(50.r),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 150,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: body,
            ),
          ),
        ],
      ),
    );
  }
}
