import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/favorite/view/favorite_view.dart';
import 'package:note_app/home/controller/home_controller.dart';
import 'package:note_app/note_detail/view/note_detail_view.dart';
import 'package:note_app/profile/view/profile_view.dart';
import 'package:note_app/widgets/custom_note_tile.dart';
import 'package:note_app/widgets/custom_pass_note.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  var homecontroller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      initState: (state) {
        homecontroller.isLoading = true;
        homecontroller.notlariYansit();
      },
      builder: (hc) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            title: Text(
              "My notes",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                  color: Colors.black),
            ),
            leading: IconButton(
                onPressed: () {
                  Get.to(() => ProfileView());
                },
                icon: Icon(
                  Icons.person,
                  color: Colors.black,
                )),
            actions: [
              IconButton(
                  onPressed: () => hc.noteAddDialog(),
                  icon: const Icon(
                    Icons.add,
                    color: Colors.black,
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: () {
                      Get.to(() => FavoriteView());
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.deepPurple.shade200,
                    )),
              ),
            ],
          ),
          body: hc.isLoading
              ? Center(
                  child: const CircularProgressIndicator(color: Colors.black),
                )
              : GridView.builder(
                  scrollDirection: Axis.vertical,
                  primary: false,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: hc.notList.length,
                  itemBuilder: (context, index) {
                    var notes = hc.notList[index]; //hangi eleman olduğu
                    return InkWell(
                      onTap: () {
                        if (notes["şifreliMi"] == true) {
                          hc.enterNotePassDialog(notes);
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
      },
    );
  }
}
