import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/auth/login/controller/login_controller.dart';
import 'package:note_app/auth/register/view/register_view.dart';
import 'package:note_app/styles/styles.dart';
import 'package:note_app/widgets/custom_auth.dart';
import 'package:note_app/widgets/custom_button.dart';
import 'package:note_app/widgets/custom_textform_container.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (lc) {
          return Scaffold(
            body: Container(
              width: Get.size.width,
              height: Get.size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40.0),
                            child: Text(
                                "Lorem Ipsum, dizgi ve baskı endüstrisinde numune",
                                style: TextStyle(
                                    color: Color(0xff21283c),
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(height: 25.0),
                          CustomTextFormContainer(
                              title: "E-mail",
                              controller: lc.emailcontroller,
                              onchange: (value) {
                                if (value.isEmpty) {
                                  lc.setEmailCheck(false);
                                } else if (!value.contains("@")) {
                                  lc.setEmailCheck(false);
                                } else {
                                  lc.setEmailCheck(true);
                                }
                              },
                              check: lc.emailCheck),
                          SizedBox(height: 25.0),
                          CustomTextFormContainer(
                              issPassword: true,
                              title: "Password",
                              controller: lc.passwordcontroller,
                              onchange: (value) {
                                if (value.isEmpty) {
                                  lc.setPassCheck(false);
                                } else if (value.length < 6) {
                                  lc.setPassCheck(false);
                                } else {
                                  lc.setPassCheck(true);
                                }
                              },
                              check: lc.passwordCheck),
                          SizedBox(height: 50),
                          CustomAuthButton(
                              title: "Create new Account",
                              onTap: () {
                                Get.to(RegisterView());
                              },
                              icon: Icons.arrow_forward_ios)
                        ],
                      ),
                    ),
                  ),
                  CustomButton(
                      onTap: () {
                        lc.loginControl();
                      },
                      title: "Sign Up")
                ],
              ),
            ),
          );
        });
  }
}
