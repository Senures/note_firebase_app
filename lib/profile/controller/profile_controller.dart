import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:note_app/auth/login/view/login_view.dart';

class ProfileController extends GetxController {
  String? bd;
  String? name;
  String? surname;
  String? phoneNumber;
  String? email;
  String? gender;
  bool? isMarried;

  bool isLoading = false;

  @override
  void onInit() {
    getUserData();
    super.onInit();
  }

  setIsLoading(bool b) {
    isLoading = b;
    update();
  }

  getUserData() async {
    setIsLoading(true);

    var currentUser = FirebaseAuth.instance.currentUser;
    var userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser!.uid)
        .get();

    bd = userDoc.data()!['birthdate'];
    name = userDoc.data()!['name'];
    surname = userDoc.data()!['surname'];
    phoneNumber = userDoc.data()!['phoneNumber'];
    email = userDoc.data()!['email'];
    gender = userDoc.data()!['gender'];
    isMarried = userDoc.data()!['isMarried'];

    setIsLoading(false);

    update();
  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(() => LoginView());
  }
}
