import 'dart:developer';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import '../helpers/constants.dart';

import 'dart:convert';

import '../models/api_response.dart';
import '../models/patient.dart';

class PatientService {
  Future<List<Patient>> fetchPatients() async {
    final queryParameters = {
      'doctorId': '07787afb-0e9f-486a-87c0-580ba39bb8fe',
      //'id': 49
    };

    final response = await http.get(
        Uri.parse(ApiConstants.baseUrl + ApiConstants.patientsEndpoint)
            .replace(queryParameters: queryParameters));

    //var body = jsonDecode(response.body);
    var body = ApiResponse.fromJson(jsonDecode(response.body));

    if (response.statusCode == 200) {
      return patientFromJson(jsonEncode(body.data));
    } else {
      throw Exception('Failed to load patients');
    }
  }
}
