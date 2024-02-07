import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:whatsapp/Controllers/loginController.dart';
import 'package:whatsapp/screen/Selectcontact.dart';

import 'package:whatsapp/screen/calls.dart';
import 'package:whatsapp/screen/profile.dart';
import 'package:whatsapp/screen/status.dart';
import 'package:whatsapp/widgets/chats.dart';
import 'package:whatsapp/widgets/groupscreenwidget.dart';
//import 'package:whatsapp/screen/chats2.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

final logincontroller = Get.put(Logincontroller());

class _homescreenState extends State<homescreen> {
  @override
  void initState() {
    logincontroller.updateActiveStatus(true);

    SystemChannels.lifecycle.setMessageHandler((message) {
      if (message.toString().contains('paused') ||
          message.toString().contains('inactive')) {
        setState(() {
          logincontroller.updateActiveStatus(false);
        });
      } else {
        setState(() {
          logincontroller.updateActiveStatus(true);
        });
      }
      return Future.value(message);
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 75,
          backgroundColor: Color.fromARGB(255, 4, 86, 4),
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
                      onTap: () => logincontroller.userlogout(),
                      child: Text("Logout"),
                      value: "Logout",
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
              labelStyle: TextStyle(fontSize: 18),
              unselectedLabelStyle: TextStyle(fontSize: 15),
              unselectedLabelColor: Colors.white,
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.only(bottom: 3),
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
                    child: Center(child: Text("Groups"))),
                Container(
                    width: size.width,
                    height: 40,
                    child: Center(child: Text("Updates"))),
                Container(
                    width: size.width,
                    height: 40,
                    child: Center(child: Text("Calls"))),
              ]),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 4, 86, 4),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Selectcontact();
                },
              ),
            );
          },
          child: Icon(
            Icons.message,
            color: Colors.white,
          ),
        ),
        body: TabBarView(children: [
          Chats(),
          groupscreen(),
          status(),
          Calls(),
        ]),
      ),
    );
  }
}



// Widget community() {}
