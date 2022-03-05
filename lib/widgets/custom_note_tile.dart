import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomNoteTile extends StatelessWidget {
  final dynamic notes;
  const CustomNoteTile({Key? key, required this.notes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Padding(
        padding: EdgeInsets.only(top: 8, bottom: 8, left: 25, right: 25),
        child: Column(
          children: [
            Expanded(
                child: Container(
              width: Get.size.width,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10.0),
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black38,
                        blurRadius: 5,
                        offset: Offset(0, 5),
                        spreadRadius: 1)
                  ]),
              child: Text(notes["note_description"]),
            )),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                notes["note_title"],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
