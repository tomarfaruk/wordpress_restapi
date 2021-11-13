import 'package:flutter/material.dart';
import 'package:get/get.dart';

void myProgressDialog() {
  Get.defaultDialog(
    radius: 5,
    backgroundColor: Color(0xffF9F9F9),
    onWillPop: () => Future.value(false),
    title: "",
    titleStyle: TextStyle(fontSize: 18),
    content: Container(child: CircularProgressIndicator()),
  );
}
