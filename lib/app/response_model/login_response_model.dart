// To parse this JSON data, do
//
//     final activitySellProductResponse = activitySellProductResponseFromJson(jsonString);

import 'dart:convert';

LoginResponseModel activitySellProductResponseFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String activitySellProductResponseToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  LoginResponseModel({
    required this.token,
    required this.userEmail,
    required this.userNicename,
    required this.userDisplayName,
  });

  String token;
  String userEmail;
  String userNicename;
  String userDisplayName;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        token: json["token"] ?? '',
        userEmail: json["user_email"] ?? '',
        userNicename: json["user_nicename"] ?? '',
        userDisplayName: json["user_display_name"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user_email": userEmail,
        "user_nicename": userNicename,
        "user_display_name": userDisplayName,
      };
}
