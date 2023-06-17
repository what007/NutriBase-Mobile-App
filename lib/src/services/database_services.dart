import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:demoapp/model/to_do.dart';

class DatabaseService {
  CollectionReference todosCollection =
      FirebaseFirestore.instance.collection("Todos");

  Future createNewTodo(String title) async {
    return await todosCollection.add({
      "title": title,
      "isComplet": false,
    });
  }

  Future completTask(uid) async {
    await todosCollection.doc(uid).update({"isComplet": true});
  }

  Future removeTodo(uid) async {
    await todosCollection.doc(uid).delete();
  }

  List<Todo> todoFromFirestore(QuerySnapshot snapshot) {
    if (snapshot != null && snapshot.docs.isNotEmpty) {
      return snapshot.docs.map((e) {
        Map<String, dynamic> data = e.data() as Map<String, dynamic>;
        return Todo(
          isComplet: data["isComplet"],
          title: data["title"],
          uid: e.id,
        );
      }).toList();
    } else {
      return [];
    }
  }

  Stream<List<Todo>> listTodos() {
    return todosCollection.snapshots().map(todoFromFirestore);
  }
}
