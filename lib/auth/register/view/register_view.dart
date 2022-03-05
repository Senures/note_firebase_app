import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:note_app/auth/register/controller/register_controller.dart';
import 'package:note_app/styles/styles.dart';
import 'package:note_app/widgets/custom_auth.dart';
import 'package:note_app/widgets/custom_button.dart';
import 'package:note_app/widgets/custom_textform_container.dart';

// ignore: must_be_immutable
class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);

  var controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
        init: RegisterController(),
        builder: (rc) {
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
            child: SafeArea(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(height: 25.0),
                          CustomTextFormContainer(
                            title: "Name",
                            controller: rc.namecontroller,
                            onchange: (value) {
                              if (value.length >= 3) {
                                rc.setNameCheck(true);
                              } else {
                                rc.setNameCheck(false);
                              }
                            },
                            check: rc.nameCheck,
                          ),
                          SizedBox(height: 25.0),
                          CustomTextFormContainer(
                            title: "Surname",
                            controller: rc.surnamecontroller,
                            onchange: (value) {
                              if (value.length >= 3) {
                                rc.setsurNameCheck(true);
                              } else {
                                rc.setsurNameCheck(false);
                              }
                            },
                            check: rc.surnameCheck,
                          ),
                          SizedBox(height: 25.0),
                          Container(
                            width: 320.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                color: const Color(0xffeceff1)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      width: 250.0,
                                      child: Text(
                                        "BirthDate",
                                        style: const TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff21283c),
                                        ),
                                      )),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(
                                        width: 180.0,
                                        child: DateTimePicker(
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                          //controller: rc.birthdatecontroller,
                                          initialValue:
                                              DateTime.now().toString(),
                                          firstDate: DateTime(1922),
                                          lastDate: DateTime(2100),
                                          dateLabelText: 'Date',
                                          onChanged: (val) {
                                            if (val.isEmpty) {
                                              rc.setbirthDateCheck(false);
                                            } else {
                                              rc.setBirthString(val);
                                              rc.setbirthDateCheck(true);
                                            }
                                          },
                                        ),
                                      ),
                                      rc.birhdateCheck == true
                                          ? Icon(
                                              Icons.check_circle_rounded,
                                              color: Colors.green,
                                            )
                                          : Icon(
                                              Icons.close,
                                              color: Colors.red,
                                            )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 25.0),
                          Container(
                            width: 320.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                color: const Color(0xffeceff1)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      width: 250.0,
                                      child: Text(
                                        "Gender",
                                        style: const TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff21283c),
                                        ),
                                      )),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        child: ListTile(
                                          leading: Radio<String>(
                                            activeColor: Colors.green,
                                            value: 'male',
                                            groupValue: rc
                                                .selectedGender, //seçili olan değer
                                            onChanged: (value) {
                                              //seçtiğimiz valueyu groupvaluesına atıyorumki neyi seçtiğim görünsün
                                              rc.setGender("male");
                                            },
                                          ),
                                          title: const Text('Male'),
                                        ),
                                      ),
                                      Expanded(
                                        child: ListTile(
                                          leading: Radio<String>(
                                            activeColor: Colors.green,
                                            value: 'female',
                                            groupValue: rc
                                                .selectedGender, //seçili olan değer
                                            onChanged: (value) {
                                              rc.setGender("female");
                                            },
                                          ),
                                          title: const Text('Female'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 25.0),
                          Container(
                            width: 320.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                color: const Color(0xffeceff1)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      width: 250.0,
                                      child: Text(
                                        "Married",
                                        style: const TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff21283c),
                                        ),
                                      )),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        child: ListTile(
                                          leading: Radio<String>(
                                            activeColor: Colors.green,
                                            value: 'yes',
                                            groupValue: rc
                                                .selectedMarried, //seçili olan değer
                                            onChanged: (value) {
                                              //seçtiğimiz valueyu groupvaluesına atıyorumki neyi seçtiğim görünsün
                                              rc.setMarried("yes");
                                            },
                                          ),
                                          title: const Text('Yes'),
                                        ),
                                      ),
                                      Expanded(
                                        child: ListTile(
                                          leading: Radio<String>(
                                            activeColor: Colors.green,
                                            value: 'no',
                                            groupValue: rc
                                                .selectedMarried, //seçili olan değer
                                            onChanged: (value) {
                                              rc.setMarried("no");
                                            },
                                          ),
                                          title: const Text('No'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 25.0),
                          CustomTextFormContainer(
                            title: "Phone Number",
                            inputFormatters: [maskFormatter],
                            controller: rc.phonecontroller,
                            onchange: (value) {
                              if (value.isEmpty) {
                                rc.setPhoneCheck(false);
                              } else if (value.length < 15) {
                                rc.setPhoneCheck(false);
                              } else {
                                rc.setPhoneCheck(true);
                              }
                            },
                            check: rc.phoneCheck,
                          ),
                          SizedBox(height: 25.0),
                          CustomTextFormContainer(
                            title: "E-mail",
                            controller: rc.emailcontroller,
                            onchange: (value) {
                              if (!value.contains("@")) {
                                rc.setEmailCheck(false);
                              } else if (value.isEmpty) {
                                rc.setEmailCheck(false);
                              } else {
                                rc.setEmailCheck(true);
                              }
                            },
                            check: rc.emailCheck,
                          ),
                          SizedBox(height: 25.0),
                          CustomTextFormContainer(
                            issPassword: true,
                            title: "Password",
                            controller: rc.passwordcontroller,
                            onchange: (value) {
                              rc.passvalue = value;
                              if (value.length < 6) {
                                rc.setPasswordCheck(false);
                              } else if (value.isEmpty) {
                                rc.setPasswordCheck(false);
                              } else {
                                rc.setPasswordCheck(true);
                              }
                            },
                            check: rc.passwordCheck,
                          ),
                          SizedBox(height: 25.0),
                          CustomTextFormContainer(
                            issPassword: true,
                            title: "Confirm",
                            controller: rc.confirmcontroller,
                            onchange: (value) {
                              if (value != rc.passvalue) {
                                rc.setConfirmCheck(false);
                              } else if (value.isEmpty) {
                                rc.setConfirmCheck(false);
                              } else {
                                rc.setConfirmCheck(true);
                              }
                            },
                            check: rc.confirmCheck,
                          ),
                          SizedBox(height: 25.0),
                          CustomAuthButton(
                              title: "Do you have a account",
                              onTap: () {
                                Get.back();
                              },
                              icon: Icons.arrow_back_ios),
                          SizedBox(height: 80.0)
                        ],
                      ),
                    ),
                  ),
                  CustomButton(
                      onTap: () {
                        rc.registerContrl();
                      },
                      title: "Register"),
                ],
              ),
            ),
          ));
        });
  }
}
