import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/auth/login/view/login_view.dart';
import 'package:note_app/styles/styles.dart';

class RegisterController extends GetxController {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController surnamecontroller = TextEditingController();
  TextEditingController birthdatecontroller = TextEditingController();
  TextEditingController gendercontroller = TextEditingController();
  TextEditingController marriedcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();

  var selectedGender = "male";
  var selectedMarried = "no";

  bool? emailCheck;
  bool? passwordCheck;
  bool? confirmCheck;
  bool? nameCheck;
  bool? surnameCheck;
  bool? birhdateCheck;
  bool? phoneCheck;

  String? passvalue;
  String? birthdate;

  @override
  void onInit() {
    emailCheck = false;
    passwordCheck = false;
    confirmCheck = false;
    nameCheck = false;
    surnameCheck = false;
    phoneCheck = false;
    birhdateCheck = false;

    super.onInit();
  }

  setBirthString(String birth) {
    birthdate = birth;
    update();
  }

  setGender(String gender) {
    selectedGender = gender;
    update();
  }

  setMarried(String value) {
    selectedMarried = value;
    update();
  }

  setNameCheck(bool b) {
    nameCheck = b;
    update();
  }

  setsurNameCheck(bool b) {
    surnameCheck = b;
    update();
  }

  setPhoneCheck(bool b) {
    phoneCheck = b;
    update();
  }

  setbirthDateCheck(bool b) {
    birhdateCheck = b;
    update();
  }

  setEmailCheck(bool b) {
    emailCheck = b;
    update();
  }

  setPasswordCheck(bool b) {
    passwordCheck = b;
    update();
  }

  setConfirmCheck(bool b) {
    confirmCheck = b;
    update();
  }

  registerContrl() {
    if (passwordCheck == true &&
        emailCheck == true &&
        confirmCheck == true &&
        nameCheck == true &&
        surnameCheck == true &&
        birhdateCheck == true &&
        phoneCheck == true) {
      register();
    } else {
      snackBar(Color(0xfff44336), "Warnings!", "Fill in the blanks.");
    }
  }

  register() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailcontroller.text, password: passwordcontroller.text);
      if (userCredential != null) {
        addUserCollection(userCredential);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        snackBar(Color(0xfff44336), "Weak-password",
            "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        snackBar(Color(0xfff44336), "Email-already-in-use",
            "The account already exists for that email.");
      } else if (e.code == 'invalid-email') {
        snackBar(Color(0xfff44336), "Invalid-email",
            "This e-mail invalid-emailInvalid-email");
      }
    } catch (e) {
      print(e);
    }
  }

  addUserCollection(UserCredential userCredential) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    await users.doc(userCredential.user!.uid).set({
      "useruid": userCredential.user!.uid,
      "email": emailcontroller.text,
      "name": namecontroller.text,
      "surname": surnamecontroller.text,
      "birthdate": birthdate,
      "gender": selectedGender,
      "married": selectedMarried,
      "phoneNumber": phonecontroller.text,
    });
    Get.to(() => LoginView());
  }
}
