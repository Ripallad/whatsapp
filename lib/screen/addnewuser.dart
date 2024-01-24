import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:whatsapp/Controllers/loginController.dart';

class Addnewuser extends StatelessWidget {
  const Addnewuser({super.key});

  @override
  Widget build(BuildContext context) {
    final logincontroller = Get.put(Logincontroller());
    var namecontroller = TextEditingController();
    return SafeArea(
      child: Obx(
        () => logincontroller.obxcheck == true
            ? Scaffold()
            : Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: Text(
                    "Profile info",
                    style: TextStyle(
                        fontSize: 20,
                        color: const Color.fromARGB(255, 27, 160, 222)),
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Column(
                    children: [
                      Text(
                        "Please provide your name and an optional profile photo",
                        style: TextStyle(
                            color: Color.fromARGB(255, 169, 166, 166)),
                      ),
                      40.heightBox,
                      InkWell(
                        onTap: () async {
                          await logincontroller.pickimage();
                        },
                        child: logincontroller.selectedProfile.value == ''
                            ? CircleAvatar(
                                radius: 40,
                                backgroundImage:
                                    AssetImage("assets/images/empty_user.jpg"),
                              )
                            : CircleAvatar(
                                radius: 40,
                                backgroundImage: FileImage(File(
                                    logincontroller.selectedProfile.value))),
                      ),
                      20.heightBox,
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Container(
                                width: 350,
                                child: TextFormField(
                                  controller: namecontroller,
                                )),
                            Expanded(
                                child: Icon(
                              Icons.insert_emoticon,
                            )),
                          ],
                        ),
                      ),
                      50.heightBox,
                      InkWell(
                        onTap: () {
                          logincontroller.addnewuser(namecontroller.text,
                              File(logincontroller.selectedProfile.value));
                        },
                        child: Container(
                          width: 100,
                          height: 35,
                          decoration: BoxDecoration(
                            color: Color(0xFF00A884),
                          ),
                          child: "NEXT"
                              .text
                              .white
                              .size(15)
                              .fontWeight(FontWeight.w600)
                              .makeCentered(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
