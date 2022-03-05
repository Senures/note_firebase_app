import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoteDetailController extends GetxController {
  TextEditingController baslikcontroller = TextEditingController();
  TextEditingController aciklamacontroller = TextEditingController();
  bool isLoading = true;
  String? title;
  String? description;
  TextEditingController yenisifre = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  bool isFav = false;
  bool isPass = false;

  var controlListen;

  final notId;

  NoteDetailController({required this.notId});

  var currentUser;
  var notDocs;

  @override
  void onInit() {
    currentUser = FirebaseAuth.instance.currentUser;

    notDocs = FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser!.uid)
        .collection('notes')
        .doc(notId);

    notGetir();

    super.onInit();
  }

  setIsFavori() {
    isFav = !isFav;
    update();

    addFavori();
  }

  setIsLoading(bool b) {
    isLoading = b;
    update();
  }

  notGetir() {
    notDocs.snapshots().listen((event) {
      if (event.data() != null) {
        title = event.data()!["note_title"];
        description = event.data()!["note_description"];
        isFav = event.data()!['favoriMi'];
        isPass = event.data()!['şifreliMi'];
      }

      setIsLoading(false);
    });
  }

  updateFirebase() async {
    setIsLoading(true);

    await notDocs.update({
      "note_title": title,
      "note_description": description,
    });
    setIsLoading(false);
    Get.back();
  }

  updatePassword(String pass, bool isPass) async {
    setIsLoading(true);

    await notDocs.update({
      "password": pass,
      'şifreliMi': isPass,
    });
    setIsLoading(false);
    Get.back();
  }

  deleteNot() async {
    setIsLoading(false);
    Get.back();

    await notDocs.delete();

    update();
  }

  addFavori() async {
    await notDocs.update({
      'favoriMi': isFav,
    });
  }

  passOptionsDialog() {
    Get.dialog(AlertDialog(
      title: const Text(
        "Password related actions",
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            onTap: () {
              Get.back();
              Get.dialog(AlertDialog(
                title: const Text("Change your password"),
                content: TextFormField(
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter your new password"),
                  obscureText: true,
                  controller: yenisifre,
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        updatePassword(yenisifre.text, true);
                      },
                      child: Text(
                        "Save",
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              ));
            },
            title: const Text("Change your password"),
          ),
          ListTile(
            onTap: () {
              Get.back();
              Get.dialog(AlertDialog(
                title: const Text("Remove password"),
                content: const Text("Do you want to remove your password?"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text(
                        "No",
                        style: TextStyle(color: Colors.black),
                      )),
                  TextButton(
                      onPressed: () {
                        updatePassword('', false);
                        Get.back();
                      },
                      child: const Text(
                        "Yes",
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              ));
            },
            title: const Text("Password Removal"),
          ),
        ],
      ),
    ));
  }

  createNotePassDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text(
          "Create password",
          textAlign: TextAlign.center,
        ),
        content: TextFormField(
          obscureText: true,
          cursorColor: Colors.black,
          decoration: const InputDecoration(
              border: InputBorder.none, hintText: "Enter your password"),
          controller: newPassword,
        ),
        actions: [
          TextButton(
              onPressed: () {
                updatePassword(newPassword.text, true);
                Get.back();
              },
              child: Text(
                "Create",
                style: TextStyle(color: Colors.black),
              ))
        ],
      ),
    );
  }
}
