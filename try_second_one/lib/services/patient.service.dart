import 'dart:developer';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../helpers/constants.dart';

import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/api_response.dart';
import '../models/patient.dart';

class PatientService {
  Future<List<Patient>> fetchPatients() async {
    const storage = FlutterSecureStorage();
    final prefs = await SharedPreferences.getInstance();

    String? userId = prefs.getString("userId");
    String? user_token = prefs.getString("user_token");
    /* storage
        .read(key: 'user_token')
        .then((value) => user_token = value.toString());
    storage.read(key: 'userId').then((value) => userId = value.toString());
*/
    print('value.token: $user_token ');
    print('userId: $userId ');
    //if (userId != null && user_token != null) {
    final queryParameters = {
      'userId': userId,
    };

    final response = await http.get(
      Uri.parse(ApiConstants.baseUrl + ApiConstants.patientsEndpoint)
          .replace(queryParameters: queryParameters),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $user_token'
      },
    );

    print(response.body);
    var body = ApiResponse.fromJson(jsonDecode(response.body));

    if (response.statusCode == 200) {
      return patientFromJson(jsonEncode(body.data));
    } else {
      throw Exception('Failed to load patients');
    }
    // }
  }
}
