import 'package:flutter/material.dart';

class CustomPassNote extends StatelessWidget {
  const CustomPassNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8, bottom: 8, left: 25, right: 25),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                // ignore: prefer_const_literals_to_create_immutables
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38,
                      blurRadius: 5,
                      offset: Offset(0, 5),
                      spreadRadius: 1)
                ],
                borderRadius: BorderRadius.circular(10.0),
                image: const DecorationImage(
                    image: AssetImage("assets/images/background.png"),
                    fit: BoxFit.cover),
              ),
              child: const Center(
                child: Icon(
                  Icons.lock_outline,
                  size: 70.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(''),
          )
        ],
      ),
    );
  }
}
