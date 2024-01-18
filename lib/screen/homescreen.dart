import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp/Controllers/loginController.dart';
import 'package:whatsapp/models/chatuserModel.dart';
import 'package:whatsapp/screen/calls.dart';
import 'package:whatsapp/screen/chats1.dart';
import 'package:whatsapp/screen/status.dart';
// import 'package:whatsapp/screen/chats2.dart';

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
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
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

Widget Chats() {
  final loginController = Get.put(Logincontroller());
  return StreamBuilder(
      stream: loginController.firestore.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ChatUser> datalist = [];
          var mydata = snapshot.data?.docs;

          datalist = mydata
                  ?.map(
                    (e) => ChatUser.fromMap(e.data()),
                  )
                  .toList() ??
              [];
          log(datalist.toString());

          // for (var i in mydata!) {
          //   datalist.add(jsonEncode(i.data()));
          // }
          print(datalist);
          return ListView.builder(
            itemCount: datalist.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListTile(
                  leading: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/p1.jpeg"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(80),
                        color: Colors.yellow),
                  ),
                  // leading: Icon(Icons.home),
                  title: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => chat1(),
                      ));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          datalist[index].name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        // title: Text("Contact $index"),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(Icons.done_all),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              datalist[index].about,
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  trailing: Text("12:50 am"),
                  // subtitle: Text("8234567534"),
                  // trailing: Icon(Icons.arrow_forward),
                ),
              );
            },
          );
        } else {
          return Text("data loading");
        }
      });
}

// Widget community() {}
