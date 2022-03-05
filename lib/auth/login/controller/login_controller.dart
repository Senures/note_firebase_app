import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:note_app/home/view/home_view.dart';
import 'package:note_app/styles/styles.dart';

class LoginController extends GetxController {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmcontroller = TextEditingController();

  bool? emailCheck;
  bool? passwordCheck;

  @override
  void onInit() {
    emailCheck = false;
    passwordCheck = false;
    super.onInit();
  }

  setEmailCheck(bool b) {
    emailCheck = b;
    update();
  }

  setPassCheck(bool b) {
    passwordCheck = b;
    update();
  }

  loginControl() {
    if (emailCheck == true && passwordCheck == true) {
      login();
    } else {
      snackBar(Color(0xfff44336), "Warnings!", "Fill in the blanks.");
    }
  }

  login() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailcontroller.text,
        password: passwordcontroller.text,
      );
      if (userCredential != null) {
        Get.offAll(() => HomeView());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        snackBar(Color(0xfff44336), "User-not-found",
            "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        snackBar(Color(0xfff44336), "Wrong-password",
            "Wrong password provided for that user.");
      }
    }
  }
}
