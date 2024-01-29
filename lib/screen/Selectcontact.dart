import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:whatsapp/Controllers/loginController.dart';

import 'package:whatsapp/models/chatuserModel.dart';
import 'package:whatsapp/screen/chats1.dart';
import 'package:whatsapp/screen/newgroup.dart';

class Selectcontact extends StatelessWidget {
  const Selectcontact({super.key});

  @override
  Widget build(BuildContext context) {
    final logincontroller = Get.put(Logincontroller());

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 55,
        titleSpacing: 0,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color.fromARGB(255, 4, 86, 4),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select contact",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              "302 contacts",
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_outlined))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Get.to(() => NewGroup());
            },
            child: ListTile(
              //contentPadding: EdgeInsets.all(0),
              contentPadding:
                  EdgeInsets.only(top: 10, left: 10, right: 0, bottom: 0),
              leading: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 4, 86, 4),
                radius: 24,
                child: Icon(
                  Icons.group,
                  color: Colors.white,
                ),
              ),
              title: Text("New Group"),
              titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 17),
            ),
          ),
          10.heightBox,
          Padding(
            padding: const EdgeInsets.only(left: 13),
            child: Text(
              "Contacts on WhatsApp",
              style: TextStyle(color: Colors.grey.shade600, fontSize: 15),
            ),
          ),
          10.heightBox,
          Expanded(
            child: StreamBuilder(
                stream:
                    logincontroller.firestore.collection('users').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<ChatUser> users = [];
                    final data = snapshot.data?.docs;
                    users =
                        data?.map((e) => ChatUser.fromMap(e.data())).toList() ??
                            [];

                    return ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              bottom: 10, left: 0, right: 0),
                          child: ListTile(
                            leading: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(users[index].profile),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(60),
                              ),
                            ),
                            title: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => chat1(
                                    oppuser: users[index],
                                  ),
                                ));
                              },
                              child: Text(
                                users[index].name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                            ),
                            subtitle: Text(
                              users[index].about,
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return ScaffoldMessenger(
                        child: Center(
                      child: Text("Loading Data"),
                    ));
                  }
                }),
          ),
        ],
      ),
    );
  }
}
