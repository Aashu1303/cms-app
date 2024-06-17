// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersStruct extends FFFirebaseStruct {
  OrdersStruct({
    List<DocumentReference>? order,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _order = order,
        super(firestoreUtilData);

  // "order" field.
  List<DocumentReference>? _order;
  List<DocumentReference> get order => _order ?? const [];
  set order(List<DocumentReference>? val) => _order = val;

  void updateOrder(Function(List<DocumentReference>) updateFn) {
    updateFn(order ??= []);
  }

  bool hasOrder() => _order != null;

  static OrdersStruct fromMap(Map<String, dynamic> data) => OrdersStruct(
        order: getDataList(data['order']),
      );

  static OrdersStruct? maybeFromMap(dynamic data) =>
      data is Map ? OrdersStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'order': _order,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'order': serializeParam(
          _order,
          ParamType.DocumentReference,
          isList: true,
        ),
      }.withoutNulls;

  static OrdersStruct fromSerializableMap(Map<String, dynamic> data) =>
      OrdersStruct(
        order: deserializeParam<DocumentReference>(
          data['order'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['orders'],
        ),
      );

  @override
  String toString() => 'OrdersStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is OrdersStruct && listEquality.equals(order, other.order);
  }

  @override
  int get hashCode => const ListEquality().hash([order]);
}

OrdersStruct createOrdersStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OrdersStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OrdersStruct? updateOrdersStruct(
  OrdersStruct? orders, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    orders
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addOrdersStructData(
  Map<String, dynamic> firestoreData,
  OrdersStruct? orders,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (orders == null) {
    return;
  }
  if (orders.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && orders.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final ordersData = getOrdersFirestoreData(orders, forFieldValue);
  final nestedData = ordersData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = orders.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOrdersFirestoreData(
  OrdersStruct? orders, [
  bool forFieldValue = false,
]) {
  if (orders == null) {
    return {};
  }
  final firestoreData = mapToFirestore(orders.toMap());

  // Add any Firestore field values
  orders.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOrdersListFirestoreData(
  List<OrdersStruct>? orderss,
) =>
    orderss?.map((e) => getOrdersFirestoreData(e, true)).toList() ?? [];
