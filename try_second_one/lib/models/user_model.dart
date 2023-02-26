// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

/*
 Convert the http.Response to a custom Dart object
 */
User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.fullName,
    this.title,
    this.phoneNumber,
    required this.emailAddress,
    required this.password,
  });

  String? fullName;
  int? title;
  String? phoneNumber;
  String emailAddress;
  String password;

  factory User.fromJson(Map<String, dynamic> json) => User(
        fullName: json["fullName"],
        title: json["title"],
        phoneNumber: json["phoneNumber"],
        emailAddress: json["emailAddress"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "title": title,
        "phoneNumber": phoneNumber,
        "emailAddress": emailAddress,
        "password": password,
      };
}
