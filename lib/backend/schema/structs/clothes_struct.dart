// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ClothesStruct extends FFFirebaseStruct {
  ClothesStruct({
    List<ItemStruct>? items,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _items = items,
        super(firestoreUtilData);

  // "items" field.
  List<ItemStruct>? _items;
  List<ItemStruct> get items => _items ?? const [];
  set items(List<ItemStruct>? val) => _items = val;
  void updateItems(Function(List<ItemStruct>) updateFn) =>
      updateFn(_items ??= []);
  bool hasItems() => _items != null;

  static ClothesStruct fromMap(Map<String, dynamic> data) => ClothesStruct(
        items: getStructList(
          data['items'],
          ItemStruct.fromMap,
        ),
      );

  static ClothesStruct? maybeFromMap(dynamic data) =>
      data is Map ? ClothesStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'items': _items?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'items': serializeParam(
          _items,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static ClothesStruct fromSerializableMap(Map<String, dynamic> data) =>
      ClothesStruct(
        items: deserializeStructParam<ItemStruct>(
          data['items'],
          ParamType.DataStruct,
          true,
          structBuilder: ItemStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ClothesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ClothesStruct && listEquality.equals(items, other.items);
  }

  @override
  int get hashCode => const ListEquality().hash([items]);
}

ClothesStruct createClothesStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ClothesStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ClothesStruct? updateClothesStruct(
  ClothesStruct? clothes, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    clothes
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addClothesStructData(
  Map<String, dynamic> firestoreData,
  ClothesStruct? clothes,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (clothes == null) {
    return;
  }
  if (clothes.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && clothes.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final clothesData = getClothesFirestoreData(clothes, forFieldValue);
  final nestedData = clothesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = clothes.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getClothesFirestoreData(
  ClothesStruct? clothes, [
  bool forFieldValue = false,
]) {
  if (clothes == null) {
    return {};
  }
  final firestoreData = mapToFirestore(clothes.toMap());

  // Add any Firestore field values
  clothes.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getClothesListFirestoreData(
  List<ClothesStruct>? clothess,
) =>
    clothess?.map((e) => getClothesFirestoreData(e, true)).toList() ?? [];
