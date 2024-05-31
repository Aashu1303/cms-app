import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _authToken = '';
  String get authToken => _authToken;
  set authToken(String value) {
    _authToken = value;
  }

  ProductStruct _Products = ProductStruct.fromSerializableMap(
      jsonDecode('{\"Type\":\"[]\",\"WashType\":\"[]\",\"Quantity\":\"[]\"}'));
  ProductStruct get Products => _Products;
  set Products(ProductStruct value) {
    _Products = value;
  }

  void updateProductsStruct(Function(ProductStruct) updateFn) {
    updateFn(_Products);
  }
}
