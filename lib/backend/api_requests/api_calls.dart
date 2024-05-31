import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Laundry Group Code

class LaundryGroup {
  static String getBaseUrl({
    String? authToken = '',
  }) =>
      'https://us-central1-cms-app-5f14a.cloudfunctions.net/api/';
  static Map<String, String> headers = {};
  static FetchBucketCall fetchBucketCall = FetchBucketCall();
  static AddToBucketCall addToBucketCall = AddToBucketCall();
}

class FetchBucketCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = LaundryGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'FetchBucket',
      apiUrl: '${baseUrl}order/fetch-bucket',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'auth_token': authToken,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      alwaysAllowBody: false,
    );
  }

  List<String>? type(dynamic response) => (getJsonField(
        response,
        r'''$[:].type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? washType(dynamic response) => (getJsonField(
        response,
        r'''$[:].washType''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? quantity(dynamic response) => (getJsonField(
        response,
        r'''$[:].quantity''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class AddToBucketCall {
  Future<ApiCallResponse> call({
    dynamic dataJson,
    String? authToken = '',
  }) async {
    final baseUrl = LaundryGroup.getBaseUrl(
      authToken: authToken,
    );

    final data = _serializeJson(dataJson);
    final ffApiRequestBody = data;
    return ApiManager.instance.makeApiCall(
      callName: 'AddToBucket',
      apiUrl: '${baseUrl}order/add-to-bucket',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Laundry Group Code

class LoginCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "$email",
  "password": "$password"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login',
      apiUrl:
          'https://us-central1-cms-app-5f14a.cloudfunctions.net/api/auth/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      alwaysAllowBody: false,
    );
  }

  static dynamic authToken(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class SignUpCall {
  static Future<ApiCallResponse> call({
    String? username = '',
    String? email = '',
    String? password = '',
    String? contact = '',
    String? room = '',
    String? block = '',
  }) async {
    final ffApiRequestBody = '''
{
  "username": "$username",
  "email": "$email",
  "password": "$password",
  "contact": "$contact",
  "room": "$room"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SignUp',
      apiUrl:
          'https://us-central1-cms-app-5f14a.cloudfunctions.net/api/auth/signup',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      alwaysAllowBody: false,
    );
  }
}

class AdminLoginCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
    dynamic tempJson,
  }) async {
    final temp = _serializeJson(tempJson);
    final ffApiRequestBody = '''
{
  "email": "$email",
  "password": "$password"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AdminLogin',
      apiUrl:
          'https://us-central1-cms-app-5f14a.cloudfunctions.net/api/auth/admin-login',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class TempCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    dynamic tempJson,
  }) async {
    final temp = _serializeJson(tempJson);
    final ffApiRequestBody = temp;
    return ApiManager.instance.makeApiCall(
      callName: 'Temp',
      apiUrl: 'http://localhost:3000/order/add-to-bucket',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
