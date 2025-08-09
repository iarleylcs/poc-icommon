import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RodiziosRecord extends FirestoreRecord {
  RodiziosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "data_registro" field.
  DateTime? _dataRegistro;
  DateTime? get dataRegistro => _dataRegistro;
  bool hasDataRegistro() => _dataRegistro != null;

  // "registrado_por" field.
  DocumentReference? _registradoPor;
  DocumentReference? get registradoPor => _registradoPor;
  bool hasRegistradoPor() => _registradoPor != null;

  void _initializeFields() {
    _dataRegistro = snapshotData['data_registro'] as DateTime?;
    _registradoPor = snapshotData['registrado_por'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('rodizios');

  static Stream<RodiziosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RodiziosRecord.fromSnapshot(s));

  static Future<RodiziosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RodiziosRecord.fromSnapshot(s));

  static RodiziosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RodiziosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RodiziosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RodiziosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RodiziosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RodiziosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRodiziosRecordData({
  DateTime? dataRegistro,
  DocumentReference? registradoPor,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'data_registro': dataRegistro,
      'registrado_por': registradoPor,
    }.withoutNulls,
  );

  return firestoreData;
}

class RodiziosRecordDocumentEquality implements Equality<RodiziosRecord> {
  const RodiziosRecordDocumentEquality();

  @override
  bool equals(RodiziosRecord? e1, RodiziosRecord? e2) {
    return e1?.dataRegistro == e2?.dataRegistro &&
        e1?.registradoPor == e2?.registradoPor;
  }

  @override
  int hash(RodiziosRecord? e) =>
      const ListEquality().hash([e?.dataRegistro, e?.registradoPor]);

  @override
  bool isValidKey(Object? o) => o is RodiziosRecord;
}
