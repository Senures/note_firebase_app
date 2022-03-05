import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/note_detail/view/note_detail_view.dart';
import 'package:note_app/styles/styles.dart';

class FavoriteController extends GetxController {
  bool isLoading = true;
  List<dynamic> favlist = [];

  TextEditingController enterpass = TextEditingController();

  @override
  void onInit() {
    favListGet();
    super.onInit();
  }

  setIsLoading(bool b) {
    isLoading = b;
    update();
  }

  favListGet() async {
    var currentUser = FirebaseAuth.instance.currentUser;

    FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser!.uid)
        .collection('notes')
        .where('favoriMi', isEqualTo: true)
        .snapshots()
        .listen((event) {
      favlist = event.docs;

      update();
    });
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
