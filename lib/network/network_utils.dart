import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../Utils/app_config.dart';
import '../extensions/extension_util/int_extensions.dart';
import '../extensions/shared_pref.dart';
// import '../screens/sign_in_screen.dart';
import '../extensions/common.dart';
import '../extensions/constants.dart';
import '../extensions/system_utils.dart';
import '../main.dart';
import '../utils/app_constants.dart';

Map<String, String> buildHeaderTokens() {
  Map<String, String> header = {
    HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
    HttpHeaders.cacheControlHeader: 'no-cache',
    HttpHeaders.acceptHeader: 'application/json; charset=utf-8',
    'Access-Control-Allow-Headers': '*',
    'Access-Control-Allow-Origin': '*',
  };

  if (userStore.isLoggedIn) {
    header.putIfAbsent(
        HttpHeaders.authorizationHeader, () => 'Bearer ${userStore.token}');
  }
  log(jsonEncode(header));
  return header;
}

Uri buildBaseUrl(String endPoint) {
  Uri url = Uri.parse(endPoint);
  if (!endPoint.startsWith('http')) url = Uri.parse('$mBaseUrl$endPoint');

  log('URL: ${url.toString()}');

  return url;
}

Future<Response> buildHttpResponse(String endPoint,
    {HttpMethod method = HttpMethod.gET, Map? request}) async {
  if (await isNetworkAvailable()) {
    var headers = buildHeaderTokens();
    Uri url = buildBaseUrl(endPoint);

    Response response;

    if (method == HttpMethod.pOST) {
      log('Request: $request');
      response =
          await http.post(url, body: jsonEncode(request), headers: headers);
    } else if (method == HttpMethod.dELETE) {
      response = await http.delete(url, headers: headers);
    } else if (method == HttpMethod.pUT) {
      response =
          await http.put(url, body: jsonEncode(request), headers: headers);
    } else if (method == HttpMethod.pATCH) {
      response =
          await http.patch(url, body: jsonEncode(request), headers: headers);
    } else {
      response = await http.get(url, headers: headers);
    }

    log('Response ($method): ${response.statusCode} ${response.body}');

    return response;
  } else {
    throw errorInternetNotAvailable;
  }
}

@Deprecated('Use buildHttpResponse() with HttpMethod.get instead')
Future<Response> getRequest(String endPoint) async =>
    buildHttpResponse(endPoint);

@Deprecated('Use buildHttpResponse() with HttpMethod.post instead')
Future<Response> postRequest(
  String endPoint,
  Map request,
) async =>
    buildHttpResponse(
      endPoint,
      request: request,
      method: HttpMethod.pOST,
    );

Future handleResponse(Response response) async {
  if (!await isNetworkAvailable()) {
    throw errorInternetNotAvailable;
  }

  if (response.statusCode.isSuccessful()) {
    return jsonDecode(response.body);
  } else {
    var string = await (isJsonValid(response.body));
    if (string!.isNotEmpty) {
      if (string.toString().contains("Unauthenticated")) {
        await removeKey(iSLOGIN);
        // await removeKey(USER_ID);
        await removeKey(fIRSTNAME);
        await removeKey(lASTNAME);

        await removeKey(pHONENUMBER);

        // await removeKey(WEIGHT);
        // await removeKey(WEIGHT_UNIT);
        userStore.clearUserData();
        // if (getBoolAsync(IS_SOCIAL) || !getBoolAsync(IS_REMEMBER)) {
        //   await removeKey(PASSWORD);
        //   await removeKey(EMAIL);
        // }
        // userStore.setLogin(false);
        // push(SignInScreen(), isNewTask: true);
      } else {
        throw string;
      }
    } else {
      throw 'Please try again later.';
    }
  }
}

//region Common
enum HttpMethod { gET, pOST, dELETE, pUT, pATCH }

class TokenException implements Exception {
  final String message;

  const TokenException([this.message = ""]);

  @override
  String toString() => "FormatException: $message";
}
//endregion

Future<String?> isJsonValid(json) async {
  try {
    var f = jsonDecode(json) as Map<String, dynamic>;
    return f['message'];
  } catch (e) {
    log(e.toString());
    return "";
  }
}

Future<MultipartRequest> getMultiPartRequest(String endPoint,
    {String? baseUrl}) async {
  String url = baseUrl ?? buildBaseUrl(endPoint).toString();
  log(url);
  return MultipartRequest('POST', Uri.parse(url));
}

Future<MultipartRequest> getPutMultiPartRequest(String endPoint,
    {String? baseUrl}) async {
  String url = baseUrl ?? buildBaseUrl(endPoint).toString();
  log(url);
  return MultipartRequest('PUT', Uri.parse(url));
}

Future<void> sendMultiPartRequest(MultipartRequest multiPartRequest,
    {Function(dynamic)? onSuccess, Function(dynamic)? onError}) async {
  http.Response response =
      await http.Response.fromStream(await multiPartRequest.send());

  if (response.statusCode.isSuccessful()) {
    onSuccess?.call(response.body);
  } else {
    onError?.call(errorSomethingWentWrong);
  }
}
