import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/auth/login/view/login_view.dart';
import 'package:note_app/home/view/home_view.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    checkUser();
    super.initState();
  }

  checkUser() async {
    await Future.delayed(const Duration(seconds: 3), () {
      if (user != null) {
        Get.offAll(() => HomeView());
      } else {
        Get.off(() => LoginView());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/splash.png",
                width: 150.0,
              ),
            ),
          ],
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ));
  }
}
