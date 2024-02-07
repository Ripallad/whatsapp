import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:whatsapp/Controllers/homeController.dart';
import 'package:whatsapp/Controllers/loginController.dart';
import 'package:whatsapp/screen/homescreen.dart';

class GroupCreateScreen extends StatelessWidget {
  const GroupCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homecontroller = Get.put(HomeController());
    var textController = TextEditingController();
    final loginController = Get.put(Logincontroller());
    return SafeArea(
      child: Obx(
        () => Scaffold(
          appBar: AppBar(
            toolbarHeight: 55,
            titleSpacing: 0,
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Color.fromARGB(255, 4, 86, 4),
            leading: InkWell(
                onTap: () {
                  Get.back();
                  homecontroller.selectedMembers.clear();
                },
                child: Icon(Icons.arrow_back)),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "New group",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
              child: Icon(
                Icons.done,
                color: Colors.white,
              ),
              backgroundColor: Color.fromARGB(255, 4, 86, 4),
              onPressed: () async {
                await homecontroller
                    .getFinalGroupList(logincontroller.loginuser.value!.id);
                if (textController.text != '') {
                  if (loginController.selectedProfile.value == '') {
                    await loginController
                        .assetImageToFile('assets/images/empty_user.jpg')
                        .then((file) {
                      homecontroller.addNewGroup(textController.text, file);
                    });
                  } else {
                    homecontroller.addNewGroup(textController.text,
                        File(loginController.selectedProfile.value));
                  }
                } else {
                  print("enter name");
                }
              }),
          body: Padding(
            padding: const EdgeInsets.only(left: 5, top: 15, right: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () async {
                        await logincontroller.pickImage();
                      },
                      child: logincontroller.selectedProfile.value == ''
                          ? CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  AssetImage("assets/images/empty_user.jpg"),
                            )
                          : CircleAvatar(
                              radius: 30,
                              backgroundImage: FileImage(
                                  File(logincontroller.selectedProfile.value)),
                            ),
                    ),
                    15.widthBox,
                    Container(
                      height: 23,
                      width: MediaQuery.of(context).size.width / 1.4,
                      child: TextFormField(
                        controller: textController,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(hintText: "Group Name"),
                        cursorHeight: 25,
                      ),
                    ),
                    Expanded(
                      child: Icon(
                        Icons.emoji_emotions,
                        size: MediaQuery.of(context).size.width * 0.06,
                        // color: Color(0xff128C7E),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
