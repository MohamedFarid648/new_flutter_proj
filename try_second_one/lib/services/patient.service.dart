import 'dart:developer';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import '../helpers/constants.dart';

import 'dart:convert';

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

    //  print(response.body);
    var body = jsonDecode(response.body);
    print(body['data']);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return patientFromJson(jsonEncode(
          body['data'])); //Patient.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load patients');
    }
  }
}
