// To parse this JSON data, do
//
//     final userLogin = userLoginFromJson(jsonString);

import 'dart:convert';

UserLogin userLoginFromJson(String str) => UserLogin.fromJson(json.decode(str));

String userLoginToJson(UserLogin data) => json.encode(data.toJson());

class UserLogin {
  UserLogin({
    required this.emailAddress,
    required this.password,
  });

  String emailAddress;
  String password;

  factory UserLogin.fromJson(Map<String, dynamic> json) => UserLogin(
        emailAddress: json["emailAddress"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "emailAddress": emailAddress,
        "password": password,
      };
}
