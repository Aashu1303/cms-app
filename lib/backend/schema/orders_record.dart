import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "orderID" field.
  String? _orderID;
  String get orderID => _orderID ?? '';
  bool hasOrderID() => _orderID != null;

  // "uid" field.
  DocumentReference? _uid;
  DocumentReference? get uid => _uid;
  bool hasUid() => _uid != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "updatedAt" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "items" field.
  List<ItemStruct>? _items;
  List<ItemStruct> get items => _items ?? const [];
  bool hasItems() => _items != null;

  // "totalAmount" field.
  double? _totalAmount;
  double get totalAmount => _totalAmount ?? 0.0;
  bool hasTotalAmount() => _totalAmount != null;

  // "service" field.
  String? _service;
  String get service => _service ?? '';
  bool hasService() => _service != null;

  // "deliveryDate" field.
  DateTime? _deliveryDate;
  DateTime? get deliveryDate => _deliveryDate;
  bool hasDeliveryDate() => _deliveryDate != null;

  // "orderNumber" field.
  int? _orderNumber;
  int get orderNumber => _orderNumber ?? 0;
  bool hasOrderNumber() => _orderNumber != null;

  void _initializeFields() {
    _orderID = snapshotData['orderID'] as String?;
    _uid = snapshotData['uid'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _updatedAt = snapshotData['updatedAt'] as DateTime?;
    _items = getStructList(
      snapshotData['items'],
      ItemStruct.fromMap,
    );
    _totalAmount = castToType<double>(snapshotData['totalAmount']);
    _service = snapshotData['service'] as String?;
    _deliveryDate = snapshotData['deliveryDate'] as DateTime?;
    _orderNumber = castToType<int>(snapshotData['orderNumber']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('orders');

  static Stream<OrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersRecord.fromSnapshot(s));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersRecord.fromSnapshot(s));

  static OrdersRecord fromSnapshot(DocumentSnapshot snapshot) => OrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdersRecordData({
  String? orderID,
  DocumentReference? uid,
  String? status,
  DateTime? createdAt,
  DateTime? updatedAt,
  double? totalAmount,
  String? service,
  DateTime? deliveryDate,
  int? orderNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'orderID': orderID,
      'uid': uid,
      'status': status,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'totalAmount': totalAmount,
      'service': service,
      'deliveryDate': deliveryDate,
      'orderNumber': orderNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrdersRecordDocumentEquality implements Equality<OrdersRecord> {
  const OrdersRecordDocumentEquality();

  @override
  bool equals(OrdersRecord? e1, OrdersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.orderID == e2?.orderID &&
        e1?.uid == e2?.uid &&
        e1?.status == e2?.status &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt &&
        listEquality.equals(e1?.items, e2?.items) &&
        e1?.totalAmount == e2?.totalAmount &&
        e1?.service == e2?.service &&
        e1?.deliveryDate == e2?.deliveryDate &&
        e1?.orderNumber == e2?.orderNumber;
  }

  @override
  int hash(OrdersRecord? e) => const ListEquality().hash([
        e?.orderID,
        e?.uid,
        e?.status,
        e?.createdAt,
        e?.updatedAt,
        e?.items,
        e?.totalAmount,
        e?.service,
        e?.deliveryDate,
        e?.orderNumber
      ]);

  @override
  bool isValidKey(Object? o) => o is OrdersRecord;
}
