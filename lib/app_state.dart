import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _uid = prefs.getString('ff_uid')?.ref ?? _uid;
    });
    _safeInit(() {
      _totalCost = prefs.getDouble('ff_totalCost') ?? _totalCost;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _authToken = '';
  String get authToken => _authToken;
  set authToken(String value) {
    _authToken = value;
  }

  DocumentReference? _uid;
  DocumentReference? get uid => _uid;
  set uid(DocumentReference? value) {
    _uid = value;
    value != null
        ? prefs.setString('ff_uid', value.path)
        : prefs.remove('ff_uid');
  }

  double _totalCost = 0.0;
  double get totalCost => _totalCost;
  set totalCost(double value) {
    _totalCost = value;
    prefs.setDouble('ff_totalCost', value);
  }

  int _loopStart = 0;
  int get loopStart => _loopStart;
  set loopStart(int value) {
    _loopStart = value;
  }

  int _loopEnd = 0;
  int get loopEnd => _loopEnd;
  set loopEnd(int value) {
    _loopEnd = value;
  }

  List<ItemStruct> _Clothes = [];
  List<ItemStruct> get Clothes => _Clothes;
  set Clothes(List<ItemStruct> value) {
    _Clothes = value;
  }

  void addToClothes(ItemStruct value) {
    _Clothes.add(value);
  }

  void removeFromClothes(ItemStruct value) {
    _Clothes.remove(value);
  }

  void removeAtIndexFromClothes(int index) {
    _Clothes.removeAt(index);
  }

  void updateClothesAtIndex(
    int index,
    ItemStruct Function(ItemStruct) updateFn,
  ) {
    _Clothes[index] = updateFn(_Clothes[index]);
  }

  void insertAtIndexInClothes(int index, ItemStruct value) {
    _Clothes.insert(index, value);
  }

  DocumentReference? _userOrderID;
  DocumentReference? get userOrderID => _userOrderID;
  set userOrderID(DocumentReference? value) {
    _userOrderID = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
