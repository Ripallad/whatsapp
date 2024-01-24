import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp/Controllers/loginController.dart';
import 'package:whatsapp/models/chatuserModel.dart';
import 'package:whatsapp/screen/calls.dart';
import 'package:whatsapp/screen/chats1.dart';
import 'package:whatsapp/screen/profile.dart';
import 'package:whatsapp/screen/status.dart';
import 'package:whatsapp/widgets/chats.dart';
//import 'package:whatsapp/screen/chats2.dart';

class homescreen extends StatelessWidget {
  const homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final logincontroller = Get.put(Logincontroller());
    var size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 75,
          backgroundColor: Color.fromARGB(255, 4, 86, 4),
          // leading: InkWell(
          //   onTap: () => Navigator.pop(context),
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Icon(
          //       Icons.arrow_back,
          //       color: Colors.white,
          //     ),
          //   ),
          // ),
          title: Text(
            "Whatsapp",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            Icon(
              Icons.camera_alt_outlined,
              color: Colors.white,
            ),
            SizedBox(
              width: 25,
            ),
            Icon(
              Icons.search,
              color: Colors.white,
            ),
            SizedBox(
              width: 8,
            ),
            PopupMenuButton<String>(
                iconColor: Colors.white,
                onSelected: (value) {
                  print(value);
                },
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                      child: Text("New group"),
                      value: "New group",
                    ),
                    PopupMenuItem(
                      child: Text("New broadcast"),
                      value: "New broadcast",
                    ),
                    PopupMenuItem(
                      child: Text("WhatApp web"),
                      value: "WhatApp web",
                    ),
                    PopupMenuItem(
                      child: Text("Starred Message"),
                      value: "Starred Message",
                    ),
                    PopupMenuItem(
                      onTap: () {
                        Get.to(() => Profile());
                      },
                      child: Text("Settings"),
                      value: "Settings",
                    ),
                  ];
                })
          ],
          bottom: TabBar(
              labelColor: Colors.white,
              labelStyle: TextStyle(fontSize: 20),
              unselectedLabelStyle: TextStyle(fontSize: 15),
              unselectedLabelColor: Colors.white,
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.only(bottom: 2),
              tabs: [
                // Container(
                //     width: size.width,
                //     height: 40,
                //     child: Center(child: Icon(Icons.supervisor_account))),
                Container(
                    width: size.width,
                    height: 40,
                    child: Center(child: Text("Chats"))),
                Container(
                    width: size.width,
                    height: 40,
                    child: Center(child: Text("Updates"))),
                Container(
                    width: size.width,
                    height: 40,
                    child: Center(child: Text("Calls")))
              ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            logincontroller.userlogout();
          },
          backgroundColor: Colors.green,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: TabBarView(children: [
          Chats(),
          status(),
          Calls(),
        ]),
      ),
    );
  }
}



// Widget community() {}
