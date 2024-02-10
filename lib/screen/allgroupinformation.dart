import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:whatsapp/models/chatuserModel.dart';
import 'package:whatsapp/models/groupMessage.dart';
import 'package:whatsapp/models/groupModel.dart';
import 'package:whatsapp/widgets/profilewidget.dart';

import '../Controllers/homeController.dart';
import '../Controllers/loginController.dart';

class AllGroupInformation extends StatelessWidget {
  final Group group;
  const AllGroupInformation({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    final loginController = Get.put(Logincontroller());
    return Obx(
      () => loginController.obxcheck == true
          ? Scaffold()
          : Scaffold(
              appBar: AppBar(
                toolbarHeight: 30,
                backgroundColor: Colors.white,
                actions: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
                ],
              ),
              body: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width / 3,
                        width: MediaQuery.of(context).size.width / 3,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(group.image),
                                fit: BoxFit.cover),
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(100)),
                      ),
                      Text(
                        group.groupName,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Group ${group.members.length} Members',
                        style: TextStyle(
                            fontSize: 16, color: Colors.grey.shade700),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ProfileContainer(
                              Icons.message,
                              "Message",
                              context,
                            ),
                            ProfileContainer(
                              Icons.graphic_eq,
                              "Voice chat",
                              context,
                            ),
                            ProfileContainer(
                              Icons.currency_rupee_rounded,
                              "Pay",
                              context,
                            )
                          ],
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.only(left: 15, right: 20),
                        title: Text('Add Group description'),
                        titleTextStyle:
                            TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      5.heightBox,
                      StreamBuilder(
                          stream: homeController.getGroupImages(group),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              var data = snapshot.data?.docs;
                              List<GroupMessage> allmessages = [];

                              allmessages = data!
                                  .map((e) => GroupMessage.fromMap(e.data()))
                                  .toList();
                              print(allmessages);

                              List<GroupMessage> imageMessage = [];
                              for (var i in allmessages) {
                                if (i.type == GType.Image) {
                                  imageMessage.add(i);
                                  print(imageMessage);
                                }
                              }
                              if (imageMessage.length > 0) {
                                return Container(
                                  height: 150,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7)),
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: imageMessage.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            height: 150,
                                            width: 150,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(7),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        imageMessage[index]
                                                            .message),
                                                    fit: BoxFit.cover)),
                                          ),
                                        );
                                      }),
                                );
                              } else {
                                return Container(
                                  height: 30,
                                  child: Text("No images"),
                                );
                              }
                            } else {
                              return Container(
                                height: 30,
                                child: Text("No images"),
                              );
                            }
                          }),
                      5.heightBox,
                      Card(
                          shape: RoundedRectangleBorder(),
                          color: Colors.white,
                          elevation: 0.3,
                          child: Column(
                            children: [
                              ListTile(
                                contentPadding:
                                    EdgeInsets.only(left: 15, right: 5),
                                visualDensity: VisualDensity.compact,
                                leading: Icon(Icons.notifications,
                                    color: Colors.grey.shade600),
                                title: Text("Mute notifications"),
                                titleTextStyle: TextStyle(
                                    fontSize: 15, color: Colors.black),
                                trailing: Switch(
                                  value: homeController.stopNotification.value,
                                  onChanged: (value) {
                                    homeController.stopNotification.value =
                                        value;
                                  },
                                ),
                              ),
                              listtile(
                                  "Custom notifications", Icons.music_note),
                              listtile("Meadia visibility", Icons.image),
                              listtile("Kept message", Icons.bookmark)
                            ],
                          )),
                      5.heightBox,
                      Card(
                          shape: RoundedRectangleBorder(),
                          color: Colors.white,
                          elevation: 0.3,
                          child: Column(
                            children: [
                              listtile("Encryption", Icons.lock),
                              listtile("Disappearing Messages", Icons.update),
                              ListTile(
                                contentPadding:
                                    EdgeInsets.only(left: 15, right: 10),
                                visualDensity: VisualDensity.compact,
                                leading: Icon(Icons.lock,
                                    color: Colors.grey.shade600),
                                title: Text("Chat lock"),
                                titleTextStyle: TextStyle(
                                    fontSize: 15, color: Colors.black),
                                trailing: Switch(
                                  value: homeController.chatlock.value,
                                  onChanged: (value) {
                                    homeController.chatlock.value = value;
                                  },
                                ),
                              ),
                              listtile("Group permision", Icons.settings)
                            ],
                          )),
                      5.heightBox,
                      ListTile(
                        contentPadding: EdgeInsets.only(left: 15, right: 10),
                        visualDensity: VisualDensity.compact,
                        leading: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(8)),
                            child: Icon(Icons.supervisor_account,
                                color: Colors.white)),
                        title: Text("Add group to a community"),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                        subtitle: Text(
                            "Bring members together in topic-bssed groups"),
                        subtitleTextStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                      5.heightBox,
                      Column(
                        children: List.generate(
                            group.members.length,
                            (index) => StreamBuilder(
                                stream: homeController
                                    .getSingleUser(group.members[index]),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    var data = snapshot.data!.docs;
                                    List<ChatUser> members = [];

                                    members = data
                                        .map((e) => ChatUser.fromMap(e.data()))
                                        .toList();

                                    var list = [];

                                    for (var i in members) {
                                      if (i.id ==
                                          loginController.loginuser.value!.id) {
                                        list.add(i);
                                      }
                                    }

                                    //     for (var i in data) {

                                    //   members.add(i.data());
                                    // }
                                    return ListTile(
                                      leading: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                          members[0].profile,
                                        ),
                                      ),
                                      title: Text(members[0].id ==
                                              loginController
                                                  .loginuser.value!.id
                                          ? "You"
                                          : "${members[0].name}"),
                                      subtitle: Text("${members[0].about}"),
                                    );
                                  }
                                  return Container();
                                })),
                      ),
                      5.heightBox,
                      ListTile(
                        contentPadding: EdgeInsets.only(left: 15, right: 10),
                        visualDensity: VisualDensity.compact,
                        leading: Icon(Icons.block, color: Colors.red),
                        title: Text("Block ${group.groupName}"),
                        titleTextStyle: TextStyle(
                            fontSize: 15,
                            color: Colors.red,
                            fontWeight: FontWeight.w600),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.only(left: 15, right: 10),
                        visualDensity: VisualDensity.compact,
                        leading: Icon(Icons.thumb_down, color: Colors.red),
                        title: Text("Report ${group.groupName}"),
                        titleTextStyle: TextStyle(
                            fontSize: 15,
                            color: Colors.red,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
