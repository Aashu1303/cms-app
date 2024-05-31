// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductStruct extends FFFirebaseStruct {
  ProductStruct({
    List<String>? type,
    List<String>? washType,
    List<int>? quantity,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _type = type,
        _washType = washType,
        _quantity = quantity,
        super(firestoreUtilData);

  // "Type" field.
  List<String>? _type;
  List<String> get type => _type ?? const [];
  set type(List<String>? val) => _type = val;
  void updateType(Function(List<String>) updateFn) => updateFn(_type ??= []);
  bool hasType() => _type != null;

  // "WashType" field.
  List<String>? _washType;
  List<String> get washType => _washType ?? const [];
  set washType(List<String>? val) => _washType = val;
  void updateWashType(Function(List<String>) updateFn) =>
      updateFn(_washType ??= []);
  bool hasWashType() => _washType != null;

  // "Quantity" field.
  List<int>? _quantity;
  List<int> get quantity => _quantity ?? const [];
  set quantity(List<int>? val) => _quantity = val;
  void updateQuantity(Function(List<int>) updateFn) =>
      updateFn(_quantity ??= []);
  bool hasQuantity() => _quantity != null;

  static ProductStruct fromMap(Map<String, dynamic> data) => ProductStruct(
        type: getDataList(data['Type']),
        washType: getDataList(data['WashType']),
        quantity: getDataList(data['Quantity']),
      );

  static ProductStruct? maybeFromMap(dynamic data) =>
      data is Map ? ProductStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Type': _type,
        'WashType': _washType,
        'Quantity': _quantity,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Type': serializeParam(
          _type,
          ParamType.String,
          true,
        ),
        'WashType': serializeParam(
          _washType,
          ParamType.String,
          true,
        ),
        'Quantity': serializeParam(
          _quantity,
          ParamType.int,
          true,
        ),
      }.withoutNulls;

  static ProductStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProductStruct(
        type: deserializeParam<String>(
          data['Type'],
          ParamType.String,
          true,
        ),
        washType: deserializeParam<String>(
          data['WashType'],
          ParamType.String,
          true,
        ),
        quantity: deserializeParam<int>(
          data['Quantity'],
          ParamType.int,
          true,
        ),
      );

  @override
  String toString() => 'ProductStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ProductStruct &&
        listEquality.equals(type, other.type) &&
        listEquality.equals(washType, other.washType) &&
        listEquality.equals(quantity, other.quantity);
  }

  @override
  int get hashCode => const ListEquality().hash([type, washType, quantity]);
}

ProductStruct createProductStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProductStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProductStruct? updateProductStruct(
  ProductStruct? product, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    product
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProductStructData(
  Map<String, dynamic> firestoreData,
  ProductStruct? product,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (product == null) {
    return;
  }
  if (product.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && product.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final productData = getProductFirestoreData(product, forFieldValue);
  final nestedData = productData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = product.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProductFirestoreData(
  ProductStruct? product, [
  bool forFieldValue = false,
]) {
  if (product == null) {
    return {};
  }
  final firestoreData = mapToFirestore(product.toMap());

  // Add any Firestore field values
  product.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProductListFirestoreData(
  List<ProductStruct>? products,
) =>
    products?.map((e) => getProductFirestoreData(e, true)).toList() ?? [];
