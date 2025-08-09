import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EquipamentosRecord extends FirestoreRecord {
  EquipamentosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "marca" field.
  String? _marca;
  String get marca => _marca ?? '';
  bool hasMarca() => _marca != null;

  // "mac" field.
  String? _mac;
  String get mac => _mac ?? '';
  bool hasMac() => _mac != null;

  // "foto_url" field.
  String? _fotoUrl;
  String get fotoUrl => _fotoUrl ?? '';
  bool hasFotoUrl() => _fotoUrl != null;

  // "data_solicitacao" field.
  DateTime? _dataSolicitacao;
  DateTime? get dataSolicitacao => _dataSolicitacao;
  bool hasDataSolicitacao() => _dataSolicitacao != null;

  // "solicitado_por" field.
  DocumentReference? _solicitadoPor;
  DocumentReference? get solicitadoPor => _solicitadoPor;
  bool hasSolicitadoPor() => _solicitadoPor != null;

  void _initializeFields() {
    _marca = snapshotData['marca'] as String?;
    _mac = snapshotData['mac'] as String?;
    _fotoUrl = snapshotData['foto_url'] as String?;
    _dataSolicitacao = snapshotData['data_solicitacao'] as DateTime?;
    _solicitadoPor = snapshotData['solicitado_por'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('equipamentos');

  static Stream<EquipamentosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EquipamentosRecord.fromSnapshot(s));

  static Future<EquipamentosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EquipamentosRecord.fromSnapshot(s));

  static EquipamentosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EquipamentosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EquipamentosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EquipamentosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EquipamentosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EquipamentosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEquipamentosRecordData({
  String? marca,
  String? mac,
  String? fotoUrl,
  DateTime? dataSolicitacao,
  DocumentReference? solicitadoPor,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'marca': marca,
      'mac': mac,
      'foto_url': fotoUrl,
      'data_solicitacao': dataSolicitacao,
      'solicitado_por': solicitadoPor,
    }.withoutNulls,
  );

  return firestoreData;
}

class EquipamentosRecordDocumentEquality
    implements Equality<EquipamentosRecord> {
  const EquipamentosRecordDocumentEquality();

  @override
  bool equals(EquipamentosRecord? e1, EquipamentosRecord? e2) {
    return e1?.marca == e2?.marca &&
        e1?.mac == e2?.mac &&
        e1?.fotoUrl == e2?.fotoUrl &&
        e1?.dataSolicitacao == e2?.dataSolicitacao &&
        e1?.solicitadoPor == e2?.solicitadoPor;
  }

  @override
  int hash(EquipamentosRecord? e) => const ListEquality().hash(
      [e?.marca, e?.mac, e?.fotoUrl, e?.dataSolicitacao, e?.solicitadoPor]);

  @override
  bool isValidKey(Object? o) => o is EquipamentosRecord;
}
