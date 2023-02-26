// To parse this JSON data, do
//
//     final patient = patientFromJson(jsonString);

import 'dart:convert';

List<Patient> patientFromJson(String str) =>
    List<Patient>.from(json.decode(str).map((x) => Patient.fromJson(x)));

String patientToJson(List<Patient> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Patient {
  Patient({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.id,
  });

  String fullName;
  String email;
  String phoneNumber;
  //User user;
  String id;

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        fullName: json["fullName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "email": email,
        "phoneNumber": phoneNumber,
        //"user": user.toJson(),
        "id": id,
      };
}
