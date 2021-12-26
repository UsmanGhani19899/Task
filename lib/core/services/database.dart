// import 'package:flutter/material.dart';
// import 'package:project/core/models/new_entry_model.dart';
// import 'package:project/core/services/locator.dart';
// import 'package:project/core/services/new_entry_service.dart';

// class NewEntryCrud {
//   NewEntryService _newEntryServiceApi = getit<NewEntryService>();
//   List<NewEntryModel>? newEntryModel;

//   Future addUserDocument(NewEntryModel data) async {
//     var result = await _newEntryServiceApi.addDocument(data.toJson());
//     return result;
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  static String? userUid;
  FirebaseFirestore? firestore;
  initiliase() {
    firestore = FirebaseFirestore.instance;
  }

  // static Future<void> addItem({
  //   required String from,
  //   required String? to,
  //   required String? project,
  //   required String? additionalInfo,
  //   required String? date,
  // }) async {
  //   DocumentReference documentReferencer =
  //       _mainCollection.doc(userUid).collection('newEntry').doc();

  //   Map<String, dynamic> data = <String, dynamic>{
  // "from": from,
  // "to": to,
  // "project": project,
  // "additionalInfo": additionalInfo,
  // "date": date
  //   };

  //   await documentReferencer
  //       .set(data)
  //       .whenComplete(() => print("Note item added to the database"))
  //       .catchError((e) => print(e));
  // }
  Future<void> create(String from, String to, String project,
      String additionalInfo, String date) async {
    try {
      await firestore!.collection("newEntry").add({
        "from": from,
        "to": to,
        "project": project,
        "additionalInfo": additionalInfo,
        "date": date,
      });
    } catch (e) {
      print(e);
    }
  }

  // static Stream<QuerySnapshot> readItems() {
  //   CollectionReference notesItemCollection =
  //       _mainCollection.doc(userUid).collection('items');

  //   return notesItemCollection.snapshots();
  // }

  // static Future<void> deleteItem({
  //   required String docId,
  // }) async {
  //   DocumentReference documentReferencer =
  //       _mainCollection.doc(userUid).collection('items').doc(docId);

  //   await documentReferencer
  //       .delete()
  //       .whenComplete(() => print('Note item deleted from the database'))
  //       .catchError((e) => print(e));
  // }
    Future<List> read() async {
      QuerySnapshot querySnapshot;
      List docs = [];
      try {
        querySnapshot = await firestore!.collection('newEntry').get();
        if (querySnapshot.docs.isNotEmpty) {
          for (var doc in querySnapshot.docs.toList()) {
            Map a = {
              "id": doc.id,
              "from": doc['from'],
              "to": doc["to"],
              "project": doc["project"],
              "additionalInfo": doc["additionalInfo"],
              "date": doc["date"]
            };
            docs.add(a);
          }
          return docs;
        }
      } catch (e) {
        print(e);
      }
      return docs;
    }

  Future<void> update(String id, String from, String to, String project,
      String additionalInfo, String date) async {
    try {
      await firestore!.collection("newEntry").doc(id).update({
        "from": from,
        "to": to,
        "project": project,
        "additionalInfo": additionalInfo,
        "date": date
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> delete(String id) async {
    try {
      await firestore!.collection("newEntry").doc(id).delete();
    } catch (e) {
      print(e);
    }
  }
}
