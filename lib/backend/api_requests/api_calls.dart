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
      'https://epics-puta.onrender.com/';
  static Map<String, String> headers = {
    'Authentication': 'Bearer [auth_token]',
  };
  static FetchBucketCall fetchBucketCall = FetchBucketCall();
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
        'Authentication': 'Bearer $authToken',
      },
      params: {},
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
    String? authToken = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "$email",
  "password": "$password"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login',
      apiUrl: 'https://epics-puta.onrender.com/auth/login',
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
      apiUrl: 'https://epics-puta.onrender.com/auth/signup',
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

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
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
    return json.encode(jsonVar);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
