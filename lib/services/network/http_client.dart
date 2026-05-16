//this class holds base urls, api methods, tokens , headers

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:payspliter/Utils/app_config.dart';

import '../../Utils/app_constants.dart';
import '../../extensions/shared_pref.dart';

class ApiClass {
  static final String _baseUrl = mBackendURL;

  /// Creating Header With Authenticated Data
  static Future<Map<String, String>> getHeaders({isHeader = false}) async {

    //checkUserRegistration? token = await MySharedPreferences.getMobileVerificationData();
    return ({
      "Content-Type": "application/json",
      ...(isHeader != null
          ? {
              'Authorization': 'Bearer ${getStringAsync(tOKEN)}',
            }
          : {})
    });
  }

  /// Get Method With Header Checks
  static Future<Response> get(String endPoint, {bool isHeader = true}) async {
    final headers = await getHeaders(isHeader: isHeader);

    http.Response response;
    try {
      response = await http.get(Uri.parse("$_baseUrl$endPoint"), headers: headers).timeout(const Duration(seconds: 30));
    } on SocketException {
      throw "No Internet Connection";
    } on TimeoutException {
      throw 'Network Request time out';
    }
    return response;
  }
  

  /// POST Method With Header Checks
  static Future<Response> post(String endPoint, Map<String, dynamic> object, {bool isHeader = true}) async {
    final headers = await getHeaders(isHeader: isHeader);
    http.Response response;

    try {
      response = await http
          .post(Uri.parse("$_baseUrl$endPoint"), body: jsonEncode(object), headers: headers)
          .timeout(const Duration(seconds: 30));
    } on SocketException {
      throw "No Internet Connection";
    } on TimeoutException {
      throw 'Network Request time out';
    }
    return response;
  }

  /// PATCH Method With Header Checks
  static Future<Response> patch(String endPoint, Object object, {bool isHeader = true}) async {
    final headers = await getHeaders(isHeader: isHeader);
    http.Response response;
    try {
      response = await http
          .patch(Uri.parse("$_baseUrl$endPoint"), body: object, headers: headers)
          .timeout(const Duration(seconds: 30));
    } on SocketException {
      throw "No Internet Connection";
    } on TimeoutException {
      throw 'Network Request time out';
    }
    return response;
  }

  /// DELETE Method With Header Checks
  static Future<Response> delete(String endPoint, {bool isHeader = true}) async {
    Map<String, String> headers = isHeader ? await getHeaders() : {};
    http.Response response;
    try {
      response =
          await http.delete(Uri.parse("$_baseUrl$endPoint"), headers: headers).timeout(const Duration(seconds: 30));
    } on SocketException {
      throw "No Internet Connection";
    } on TimeoutException {
      throw 'Network Request time out';
    }
    return response;
  }
}
