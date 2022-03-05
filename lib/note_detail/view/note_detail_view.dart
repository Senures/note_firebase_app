import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/note_detail/controller/note_detail_controller.dart';


class NoteDetailView extends StatelessWidget {
  final String notId;
  const NoteDetailView({Key? key, required this.notId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NoteDetailController>(
        init: NoteDetailController(notId: notId),
        builder: (ndc) {
          return ndc.isLoading
              ? Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  ),
                )
              : Scaffold(
                  appBar: AppBar(
                    elevation: 0.0,
                    backgroundColor: Colors.white,
                    leading: IconButton(
                        onPressed: () {
                          if (ndc.isPass == true) {
                            ndc.passOptionsDialog();
                          } else {
                            ndc.createNotePassDialog();
                          }
                        },
                        icon: const Icon(
                          Icons.lock_outline,
                          color: Colors.black,
                        )),
                    title: TextFormField(
                      onChanged: (val) {
                        ndc.title = val;
                      },
                      controller: TextEditingController(text: ndc.title),
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                    centerTitle: true,
                    actions: [
                      IconButton(
                        onPressed: () {
                          ndc.deleteNot();
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            ndc.updateFirebase();
                          },
                          child: const Text(
                            "Finish",
                            style:
                                TextStyle(color: Colors.black, fontSize: 17.0),
                          ))
                    ],
                  ),
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SafeArea(
                        child: Column(
                          children: [
                            TextFormField(
                              controller:
                                  TextEditingController(text: ndc.description),
                              maxLines: 100,
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                              onChanged: (val) {
                                ndc.description = val;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  floatingActionButton: FloatingActionButton(
                      backgroundColor: const Color(0xfffea215),
                      child: ndc.isFav == false
                          ? Icon(Icons.favorite_border)
                          : Icon(Icons.favorite),
                      onPressed: () {
                        ndc.setIsFavori();
                      }),
                );
        });
  }
}
