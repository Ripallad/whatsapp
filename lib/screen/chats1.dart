import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:whatsapp/Controllers/homeController.dart';
import 'package:whatsapp/Controllers/loginController.dart';
import 'package:whatsapp/models/chatuserModel.dart';
import 'package:whatsapp/models/messageModel.dart';
import 'package:whatsapp/widgets/messagewidget.dart';
import 'package:whatsapp/widgets/typemaseg.dart';

class chat1 extends StatelessWidget {
  final ChatUser oppuser;
  const chat1({super.key, required this.oppuser});

  @override
  Widget build(BuildContext context) {
    final logincontroller = Get.put(Logincontroller());
    final homecontroller = Get.put(HomeController());
    var textcontroller = TextEditingController();
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Color.fromARGB(255, 4, 86, 4),
          leadingWidth: 30,
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
          // padding: const EdgeInsets.all(15.0),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(oppuser.profile),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.blue),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    oppuser.id == logincontroller.loginuser.value?.id
                        ? "me"
                        : "${oppuser.name}",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    oppuser.lastSeen ==
                            logincontroller.loginuser.value?.lastSeen
                        ? "Message Yourself"
                        : "${oppuser.lastSeen}",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            Icon(
              Icons.videocam,
              color: Colors.white,
              size: 30,
            ),
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.call,
              color: Colors.white,
              size: 25,
            ),
            SizedBox(
              width: 10,
            ),
            PopupMenuButton<String>(
                iconColor: Colors.white,
                onSelected: (value) {
                  print(value);
                },
                color: Colors.white,
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                      child: Text("View contact"),
                      value: "View contact",
                    ),
                    PopupMenuItem(
                      child: Text("Media, links, and docs"),
                      value: "Media, links, and docs",
                    ),
                    PopupMenuItem(
                      child: Text("WhatApp web"),
                      value: "WhatApp web",
                    ),
                    PopupMenuItem(
                      child: Text("Search"),
                      value: "Search",
                    ),
                    PopupMenuItem(
                      child: Text("Mute Notification"),
                      value: "Mute Notification",
                    ),
                    PopupMenuItem(
                      child: Text("Wallpaper"),
                      value: "Wallpaper",
                    ),
                  ];
                })
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                  height: context.screenHeight,
                  width: context.screenWidth,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/whatsappbg.png"),
                          fit: BoxFit.cover)),
                  child: Padding(
                      padding: const EdgeInsets.only(left: 5, top: 10),
                      child: StreamBuilder(
                          stream: homecontroller.getMessages(oppuser),
                          builder: (context, snapshot) {
                            List<Message> messagelist = [];
                            if (snapshot.hasData) {
                              var data = snapshot.data?.docs;
                              messagelist = data
                                      ?.map((e) => Message.fromMap(e.data()))
                                      .toList() ??
                                  [];
                            }
                            return ListView.builder(
                              itemCount: messagelist.length,
                              itemBuilder: (context, index) {
                                if (messagelist[index].fromId ==
                                    logincontroller.loginuser.value?.id) {
                                  return SendMessageWidget(
                                      context, messagelist[index]);
                                } else {
                                  return ReceiveMessageWidget(
                                      context, messagelist[index]);
                                }
                              },
                            );
                          }))),
            ),
            Container(
              color: Colors.white,
              height: 80,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      Expanded(
                        child: Card(
                            margin:
                                EdgeInsets.only(left: 2, right: 2, bottom: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: TextFormField(
                              controller: textcontroller,
                              onChanged: (val1) {
                                homecontroller.enteredMessage.value =
                                    val1.toString();
                              },
                              textAlignVertical: TextAlignVertical.center,
                              keyboardType: TextInputType.multiline,
                              maxLines: 5,
                              minLines: 1,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Type a message",
                                prefixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.emoji_emotions),
                                ),
                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (builder) =>
                                                bottomsheet());
                                      },
                                      icon: Icon(Icons.attach_file),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.camera_alt),
                                    ),
                                  ],
                                ),
                                contentPadding: EdgeInsets.all(5),
                              ),
                            )),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(bottom: 8, right: 5, left: 5),
                        child: InkWell(
                          onTap: () {
                            if (homecontroller.enteredMessage.value != '') {
                              homecontroller.sendmessage(
                                  oppuser,
                                  homecontroller.enteredMessage.value,
                                  Type.text);
                              textcontroller.text = '';
                            }
                          },
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Color(0xFF128c7E),
                            child: Icon(
                                color: Colors.white,
                                homecontroller.enteredMessage.value == ''
                                    ? Icons.mic
                                    : Icons.send),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
