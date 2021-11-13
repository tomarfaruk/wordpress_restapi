import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mail_api/app/components/button.dart';
import 'package:mail_api/app/components/input_decoration.dart';
import 'package:mail_api/app/modules/home/controllers/home_controller.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final controller = Get.find<HomeController>();
  final formKey = GlobalKey<FormState>();

  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final nicknameController = TextEditingController();
  final descController = TextEditingController();

  @override
  void initState() {
    super.initState();

    var user = controller.userinfo.value;
    fNameController.text = user.firstName ?? '';
    lNameController.text = user.lastName ?? '';
    nicknameController.text = user.nickname ?? '';
    descController.text = user.description ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit profile"), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: fNameController,
                decoration: CommonDecoration.inputdecoration('First Name'),
              ),
              SizedBox(height: 24),
              TextFormField(
                controller: lNameController,
                decoration: CommonDecoration.inputdecoration('Last Name'),
              ),
              SizedBox(height: 24),
              TextFormField(
                controller: nicknameController,
                decoration: CommonDecoration.inputdecoration('nickname'),
              ),
              SizedBox(height: 24),
              TextFormField(
                controller: descController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                minLines: 8,
                decoration: CommonDecoration.inputdecoration('Description'),
              ),
              SizedBox(height: 24),
              Button(
                title: 'Update',
                height: 56,
                width: double.infinity,
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());

                  var body = <String, dynamic>{
                    'first_name': fNameController.text,
                    'last_name': fNameController.text,
                    'nickname': nicknameController.text,
                    'description': descController.text,
                  };

                  controller.userUpdate(json.encode(body));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
