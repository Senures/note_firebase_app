import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/note_detail/view/note_detail_view.dart';
import 'package:note_app/styles/styles.dart';

class HomeController extends GetxController {
  List<dynamic> notList = [];

  bool isLoading = false;
  TextEditingController enterpass = TextEditingController();
  TextEditingController addNot = TextEditingController();

  List<dynamic> usersNotes = [];

  setIsLoading(bool b) {
    isLoading = b;
    update();
  }

  addNewNote() {
    var currentUser = FirebaseAuth.instance.currentUser;

    CollectionReference notesColllection = FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser!.uid)
        .collection('notes');

    var notesDoc = notesColllection.doc();
    notesDoc.set({
      'id': notesDoc.id,
      "note_description": "You can add your notes to this section",
      "note_title": addNot.text,
      "note_date": DateTime.now().toString(),
      "password": "",
      "şifreliMi": false,
      "favoriMi": false
    });

    addNot.clear();

    update();
  }

  notlariYansit() {
    var currentUser = FirebaseAuth.instance.currentUser;

    FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser!.uid)
        .collection('notes')
        .orderBy("note_date", descending: true)
        .snapshots()
        .listen((event) {
      notList = event.docs;

      setIsLoading(false);
      update();
    });
  }

  noteAddDialog() {
    Get.dialog(AlertDialog(
      actions: [
        TextButton(
            onPressed: () {
              addNewNote();
              Get.back();
            },
            child: const Text(
              "Add Note",
              style: TextStyle(color: Colors.black),
            ))
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            cursorColor: Colors.black,
            controller: addNot,
            decoration: const InputDecoration(
                border: InputBorder.none, hintText: "Enter note title"),
          ),
        ],
      ),
    ));
  }

  enterNotePassDialog(dynamic notes) {
    Get.dialog(AlertDialog(
      title: const Text(
        "Enter password",
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            cursorColor: Colors.black,
            obscureText: true,
            controller: enterpass,
            decoration: const InputDecoration(
                border: InputBorder.none, hintText: "Enter note password"),
          )
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              enterpass.clear();
              Get.back();
            },
            child: const Text(
              "Give up",
              style: TextStyle(color: Colors.black),
            )),
        TextButton(
            onPressed: () {
              if (notes["password"] == enterpass.text) {
                enterpass.clear();
                Get.back();
                Get.to(() => NoteDetailView(
                      notId: notes["id"],
                    ));
              } else {
                enterpass.clear();
                Get.back();
                snackBar(Colors.red, "Warning", "Wrong password");
              }
            },
            child: const Text(
              "Send",
              style: TextStyle(color: Colors.black),
            )),
      ],
    ));
  }
}
