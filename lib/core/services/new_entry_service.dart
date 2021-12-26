import 'package:cloud_firestore/cloud_firestore.dart';

class NewEntryService {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  CollectionReference? ref;
  final String newEntry;

  NewEntryService(this.newEntry) {
    ref = _db.collection(newEntry);
  }
  // Future<void> updateDocument(String id, Map<String, Object> data) {
  //   return ref!.doc(id).update(data);
  // }

  Future<DocumentReference> addDocument(Map data) {
    return ref!.add(data);
  }
}
