import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp/Controllers/homeController.dart';
import 'package:whatsapp/Controllers/loginController.dart';
import 'package:whatsapp/models/chatuserModel.dart';

import '../screen/chats1.dart';

Widget Chats() {
  final loginController = Get.put(Logincontroller());
  final homeController = Get.put(HomeController());
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
                padding: const EdgeInsets.all(5.0),
                child: ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(datalist[index].profile),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(80),
                        color: Colors.yellow),
                  ),
                  // leading: Icon(Icons.home),
                  title: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => chat1(
                          oppuser: datalist[index],
                        ),
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
                            Icon(
                              Icons.done_all,
                              size: Checkbox.width,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Expanded(
                              child: Text(
                                datalist[index].about,
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // trailing: Text(
                  //   homeController.getFormatedDate(
                  //       context: context,
                  //       time: loginController.loginuser.value!.lastSeen),
                  // ),
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
