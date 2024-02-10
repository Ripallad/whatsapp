import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp/Controllers/homeController.dart';
import 'package:whatsapp/Controllers/loginController.dart';
import 'package:whatsapp/screen/allgroupinformation.dart';
import 'package:whatsapp/screen/groupChat.dart';

import '../models/groupModel.dart';

Widget groupscreen() {
  final logincontroller = Get.put(Logincontroller());
  final homecontroller = Get.put(HomeController());
  return StreamBuilder(
      stream: logincontroller.firestore.collection('groups').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Group> groups = [];
          var totaldata = snapshot.data?.docs;

          groups = totaldata!
                  .map(
                    (e) => Group.fromMap(e.data()),
                  )
                  .toList() ??
              [];

          print(groups);

          return ListView.builder(
            itemCount: groups.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: ListTile(
                  leading: InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(),
                              contentPadding: EdgeInsets.zero,
                              content: Container(
                                height: 300,
                                child: Column(
                                  children: [
                                    Expanded(
                                        child: Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  groups[index].image))),
                                    )),
                                    Container(
                                      height: 50,
                                      width: double.infinity,
                                      color: Colors.white,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Get.off(()=>GroupChat(
                                                  groupUser: groups[index]));
                                            },
                                            child: Icon(
                                              Icons.message,
                                              color: Colors.green,
                                            ),
                                          ),
                                          Icon(
                                            Icons.graphic_eq,
                                            color: Colors.green,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Get.off(()=>AllGroupInformation(
                                                  group: groups[index]));
                                            },
                                            child: Icon(
                                              Icons.info_rounded,
                                              color: Colors.green,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(groups[index].image),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(80),
                          color: Colors.yellow),
                    ),
                  ),
                  // leading: Icon(Icons.home),
                  title: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            GroupChat(groupUser: groups[index]),
                      ));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          groups[index].groupName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        // title: Text("Contact $index"),
                        SizedBox(
                          height: 5,
                        ),
                        Icon(
                          Icons.done_all,
                          size: Checkbox.width,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return ListTile(
            title: Text('no data'),
          );
        }
      });
}
