import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NpsResponseRecord extends FirestoreRecord {
  NpsResponseRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userid" field.
  DocumentReference? _userid;
  DocumentReference? get userid => _userid;
  bool hasUserid() => _userid != null;

  // "responseText" field.
  String? _responseText;
  String get responseText => _responseText ?? '';
  bool hasResponseText() => _responseText != null;

  // "rating" field.
  String? _rating;
  String get rating => _rating ?? '';
  bool hasRating() => _rating != null;

  void _initializeFields() {
    _userid = snapshotData['userid'] as DocumentReference?;
    _responseText = snapshotData['responseText'] as String?;
    _rating = snapshotData['rating'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('nps_response');

  static Stream<NpsResponseRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NpsResponseRecord.fromSnapshot(s));

  static Future<NpsResponseRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NpsResponseRecord.fromSnapshot(s));

  static NpsResponseRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NpsResponseRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NpsResponseRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NpsResponseRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NpsResponseRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NpsResponseRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNpsResponseRecordData({
  DocumentReference? userid,
  String? responseText,
  String? rating,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userid': userid,
      'responseText': responseText,
      'rating': rating,
    }.withoutNulls,
  );

  return firestoreData;
}

class NpsResponseRecordDocumentEquality implements Equality<NpsResponseRecord> {
  const NpsResponseRecordDocumentEquality();

  @override
  bool equals(NpsResponseRecord? e1, NpsResponseRecord? e2) {
    return e1?.userid == e2?.userid &&
        e1?.responseText == e2?.responseText &&
        e1?.rating == e2?.rating;
  }

  @override
  int hash(NpsResponseRecord? e) =>
      const ListEquality().hash([e?.userid, e?.responseText, e?.rating]);

  @override
  bool isValidKey(Object? o) => o is NpsResponseRecord;
}
