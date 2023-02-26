import 'dart:developer';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:try_second_one/models/api_response.dart';

import '../helpers/constants.dart';
import '../models/user_login.dart';
import '../models/user_model.dart';
import 'dart:convert';

class UserService {
  /*
  Future is a core Dart class for working with asynchronous operations. A Future object represents a potential value or error that will be available at some time in the future.

   */
  Future<Object> createUser(User user) async {
    final response = await http.post(
      Uri.parse(ApiConstants.baseUrl + ApiConstants.registerEndpoint),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user),
    );

    var body = jsonDecode(response.body);
    //print(response.body);
    //print(response.statusCode);
    return body['message'];
  }

  Future<ApiResponse> loginUser(UserLogin user) async {
    print(jsonEncode(user));
    final response = await http.post(
      Uri.parse(ApiConstants.baseUrl + ApiConstants.loginEndpoint),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user),
    );

    var body = ApiResponse.fromJson(jsonDecode(response.body));
    return body;
  }
}
