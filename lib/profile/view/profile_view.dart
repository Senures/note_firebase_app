import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/profile/controller/profile_controller.dart';
import 'package:note_app/widgets/custom_button.dart';
import 'package:note_app/widgets/custom_profile_container.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (_pc) {
        return Scaffold(
            body: _pc.isLoading
                ? Center(
                    child: CircularProgressIndicator(
                    color: Colors.black,
                  ))
                : Stack(
                    children: [
                      Positioned.fill(
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/background.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 80.0, bottom: 20.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  minRadius: 60,
                                  child: Icon(
                                    Icons.person,
                                    color: Color(0xff21283c),
                                    size: 75,
                                  ),
                                ),
                              ),
                              Text(
                                "Profile",
                                style: TextStyle(
                                    color: Color(0xff21283c),
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 30),
                              CustomProfile(
                                  icon: Icons.person,
                                  text: _pc.name.toString()),
                              Divider(
                                indent: 55.0,
                                endIndent: 30.0,
                                color: Colors.white,
                                thickness: 1,
                              ),
                              CustomProfile(
                                  icon: Icons.calendar_today,
                                  text: _pc.bd.toString()),
                              Divider(
                                color: Colors.white,
                                indent: 55.0,
                                endIndent: 30.0,
                                thickness: 1,
                              ),
                              CustomProfile(
                                  icon: Icons.phone_android_rounded,
                                  text: _pc.phoneNumber.toString()),
                              Divider(
                                color: Colors.white,
                                indent: 55.0,
                                endIndent: 30.0,
                                thickness: 1,
                              ),
                              CustomProfile(
                                  icon: Icons.mail, text: _pc.email.toString()),
                              Divider(
                                color: Colors.white,
                                indent: 55.0,
                                endIndent: 30.0,
                                thickness: 1,
                              ),
                            ],
                          ),
                        ),
                      ),
                      CustomButton(
                          onTap: () {
                            _pc.signOut();
                          },
                          title: "Sign Out")
                    ],
                  ));
      },
    );
  }
}
