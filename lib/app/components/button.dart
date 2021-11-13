import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mail_api/constants/custom_colors.dart';

class Button extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final String title;
  final VoidCallback onTap;

  const Button(
      {Key? key,
      this.height = 40,
      this.width = 130,
      this.color = CustomColors.primary,
      required this.title,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height.h,
        width: width.w,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(10.r))),
        child: Center(
          child: Text(
            '$title',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                fontSize: 16.sp,
                letterSpacing: 1.2,
                height: 1.2,
                color: CustomColors.white),
          ),
        ),
      ),
    );
  }
}
