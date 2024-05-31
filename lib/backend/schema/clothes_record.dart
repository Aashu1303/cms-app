import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ClothesRecord extends FirestoreRecord {
  ClothesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "washType" field.
  String? _washType;
  String get washType => _washType ?? '';
  bool hasWashType() => _washType != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _type = snapshotData['type'] as String?;
    _washType = snapshotData['washType'] as String?;
    _quantity = castToType<int>(snapshotData['quantity']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('clothes')
          : FirebaseFirestore.instance.collectionGroup('clothes');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('clothes').doc(id);

  static Stream<ClothesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ClothesRecord.fromSnapshot(s));

  static Future<ClothesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ClothesRecord.fromSnapshot(s));

  static ClothesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ClothesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClothesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClothesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ClothesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ClothesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createClothesRecordData({
  String? type,
  String? washType,
  int? quantity,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'type': type,
      'washType': washType,
      'quantity': quantity,
    }.withoutNulls,
  );

  return firestoreData;
}

class ClothesRecordDocumentEquality implements Equality<ClothesRecord> {
  const ClothesRecordDocumentEquality();

  @override
  bool equals(ClothesRecord? e1, ClothesRecord? e2) {
    return e1?.type == e2?.type &&
        e1?.washType == e2?.washType &&
        e1?.quantity == e2?.quantity;
  }

  @override
  int hash(ClothesRecord? e) =>
      const ListEquality().hash([e?.type, e?.washType, e?.quantity]);

  @override
  bool isValidKey(Object? o) => o is ClothesRecord;
}
