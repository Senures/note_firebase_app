import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  Function() onTap;
  String title;
  CustomButton({Key? key, required this.onTap, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 0.0,
        bottom: 0.0,
        child: InkWell(
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            child: Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 21.0),
            ),
            width: 140.0,
            height: 80.0,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                ),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xffffd00d),
                      Color(0xfffea215),
                    ])),
          ),
        ));
  }
}
