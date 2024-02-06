import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp/Controllers/homeController.dart';
import 'package:whatsapp/Controllers/loginController.dart';

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
                  leading: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(groups[index].image),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(80),
                        color: Colors.yellow),
                  ),
                  // leading: Icon(Icons.home),
                  title: Column(
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
                              groups[index].groupId,
                              style: TextStyle(fontSize: 11),
                            ),
                          ),
                        ],
                      ),
                    ],
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
