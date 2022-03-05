import 'package:flutter/material.dart';
import 'package:glass/src/GlassWidget.dart';

class CustomAuthButton extends StatelessWidget {
  final String title;
  final onTap;
  IconData icon;
  CustomAuthButton(
      {Key? key, required this.title, required this.onTap, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Color(0xff21283c),
              fontSize: 17.0,
              fontWeight: FontWeight.bold),
        ),
        InkWell(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.all(10.0),
            width: 40.0,
            height: 40.0,
            child: Icon(icon).asGlass(
                tintColor: Colors.red,
                clipBorderRadius: BorderRadius.circular(8.0)),
          ),
        )
      ],
    );
  }
}
