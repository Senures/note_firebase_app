import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomProfile extends StatelessWidget {
  final String text;
  final IconData icon;
  CustomProfile({Key? key, required this.text, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: Get.size.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          // color: const Color(0xffeceff1),
        ),
        child: Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 10.0, bottom: 0.0),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 30.0,
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 16.0, color: Color(0xff21283c)),
                  ),
                )
              ],
            )));
  }
}
