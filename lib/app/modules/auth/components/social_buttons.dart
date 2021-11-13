import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mail_api/constants/custom_colors.dart';
import 'package:mail_api/constants/custom_images.dart';
import 'package:mail_api/constants/strings.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(CustomImages.google),
                SizedBox(width: 20),
                Text(
                  Strings.google,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 14.sp,
                    letterSpacing: 1.2,
                    height: 1.2,
                    color: CustomColors.lightBlack,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 20.w),
        Expanded(
          child: Container(
            height: 50.h,
            decoration: BoxDecoration(
              color: CustomColors.blue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(CustomImages.facebook),
                SizedBox(width: 20),
                Text(
                  Strings.facebook,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 14.sp,
                    letterSpacing: 1.2,
                    height: 1.2,
                    color: CustomColors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
