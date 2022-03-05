import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/favorite/controller/favorite_controller.dart';
import 'package:note_app/note_detail/view/note_detail_view.dart';
import 'package:note_app/widgets/custom_note_tile.dart';
import 'package:note_app/widgets/custom_pass_note.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({Key? key, required}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteController>(
        init: FavoriteController(),
        builder: (fc) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              leading: Icon(
                Icons.favorite,
                color: Colors.deepPurpleAccent.shade100,
              ),
              title: Text(
                "Favori Notlarım",
                style: TextStyle(color: Colors.black),
              ),
            ),
            body: GridView.builder(
              scrollDirection: Axis.vertical,
              primary: false,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: fc.favlist.length,
              itemBuilder: (context, index) {
                var notes = fc.favlist[index]; //hangi eleman olduğu
                return InkWell(
                  onTap: () {
                    if (notes["şifreliMi"] == true) {
                      fc.enterNotePassDialog(notes);
                    } else {
                      Get.to(() => NoteDetailView(
                            notId: notes["id"],
                          ));
                    }
                  },
                  child: notes["şifreliMi"] == true
                      ? CustomPassNote()
                      : CustomNoteTile(notes: notes),
                );
              },
            ),
          );
        });
  }
}
