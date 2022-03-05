import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormContainer extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final dynamic onchange;
  int? maxlength;
  bool? check;
  List<TextInputFormatter>? inputFormatters;
  final bool? issPassword;

  CustomTextFormContainer(
      {Key? key,
      required this.title,
      required this.controller,
      required this.onchange,
      this.check,
      this.inputFormatters,
      this.maxlength,
      this.issPassword})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 320.0,
      // height: 100.0,
      //height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: const Color(0xffeceff1)),
      child: Padding(
        padding: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Color(0xff21283c),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 180.0,
                  child: TextFormField(
                    maxLength: maxlength,
                    obscureText: issPassword ?? false,
                    inputFormatters: inputFormatters,
                    cursorColor: Color(0xfffea215),
                    controller: controller,
                    style: const TextStyle(
                      color: Color(0xff21283c),
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    onChanged: onchange,
                  ),
                ),
                check == true
                    ? const Icon(
                        Icons.check_circle_rounded,
                        color: Colors.green,
                      )
                    : const Icon(
                        Icons.close,
                        color: Colors.red,
                      )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
