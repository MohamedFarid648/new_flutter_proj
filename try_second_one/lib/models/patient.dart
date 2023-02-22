// To parse this JSON data, do
//
//     final patient = patientFromJson(jsonString);

import 'dart:convert';

import 'package:try_second_one/models/program.dart';
import 'package:try_second_one/models/user_model.dart';

List<Patient> patientFromJson(String str) =>
    List<Patient>.from(json.decode(str).map((x) => Patient.fromJson(x)));

String patientToJson(List<Patient> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Patient {
  Patient({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.weight,
    required this.height,
    required this.comment,
    required this.medicalCondition,
    required this.balancedPrograms,
    required this.programId,
    //required this.program,
    required this.doctorId,
    //  required this.user,
    required this.id,
  });

  String fullName;
  String email;
  String phoneNumber;
  String weight;
  String height;
  String comment;
  int medicalCondition;
  int balancedPrograms;
  int programId;
  //Program? program;
  String doctorId;
  //User user;
  int id;

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        fullName: json["fullName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        weight: json["weight"],
        height: json["height"],
        comment: json["comment"],
        medicalCondition: json["medicalCondition"],
        balancedPrograms: json["balancedPrograms"],
        programId: json["programId"],
        //program: Program.fromJson(json["program"]),
        doctorId: json["doctorId"],
        //   user: User.fromJson(json["user"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "email": email,
        "phoneNumber": phoneNumber,
        "weight": weight,
        "height": height,
        "comment": comment,
        "medicalCondition": medicalCondition,
        "balancedPrograms": balancedPrograms,
        "programId": programId,
        //"program": program?.toJson(),
        "doctorId": doctorId,
        //"user": user.toJson(),
        "id": id,
      };
}
