import 'package:emoji_picker_flutter/emoji_picker_flutter.dart' as foundation;
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:whatsapp/Controllers/homeController.dart';
import 'package:whatsapp/Controllers/loginController.dart';
import 'package:whatsapp/models/chatuserModel.dart';
import 'package:whatsapp/models/messageModel.dart';
import 'package:whatsapp/widgets/input.dart';
import 'package:whatsapp/widgets/messagewidget.dart';

class chat1 extends StatelessWidget {
  final ChatUser oppuser;
  const chat1({super.key, required this.oppuser});

  @override
  Widget build(BuildContext context) {
    final logincontroller = Get.put(Logincontroller());
    final homecontroller = Get.put(HomeController());
    var textcontroller = TextEditingController();
    return Obx(
      // ignore: deprecated_member_use
      () => WillPopScope(
        onWillPop: () {
          homecontroller.enteredMessage.value = '';
          if (homecontroller.showemoji.value) {
            homecontroller.showemoji.value = !homecontroller.showemoji.value;
            return Future.value(false);
          } else {
            return Future.value(true);
          }
        },
        child: Scaffold(
          //    backgroundColor: Colors.blueGrey,
          appBar: AppBar(
            titleSpacing: 10,
            toolbarHeight: 90,
            backgroundColor: Color.fromARGB(255, 4, 86, 4),
            leadingWidth: 30,
            leading: InkWell(
              onTap: () {
                if (homecontroller.showemoji.value) {
                  homecontroller.showemoji.value =
                      !homecontroller.showemoji.value;
                }
                textcontroller.text = '';
                Navigator.pop(context);
              },
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        oppuser.id == logincontroller.loginuser.value?.id
                            ? "me"
                            : "${oppuser.name}",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        oppuser.id == logincontroller.loginuser.value?.id
                            ? "Message Yourself"
                            : oppuser.isActive == true
                                ? 'online'
                                : homecontroller.getLastSeen(
                                    context: context, time: oppuser.lastSeen),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
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
                width: 10,
              ),
              Icon(
                Icons.call,
                color: Colors.white,
                size: 25,
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
                                reverse: true,
                                itemCount: messagelist.length,
                                itemBuilder: (context, index) {
                                  var newindex = messagelist.length - 1 - index;
                                  if (messagelist[index].fromId ==
                                      logincontroller.loginuser.value?.id) {
                                    return SendMessageWidget(
                                        context, messagelist[newindex]);
                                  } else {
                                    return ReceiveMessageWidget(
                                        context, messagelist[newindex]);
                                  }
                                },
                              );
                            }))),
              ),
              chatinput(context, oppuser, textcontroller),
              homecontroller.showemoji.value == true
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height * 0.35,
                      child: EmojiPicker(
                        onEmojiSelected: (category, emoji) {
                          homecontroller
                              .updateEntermassage(textcontroller.text);
                          // homecontroller.enteredMessage.value =
                          //     textController.text;
                        },
                        textEditingController: textcontroller,
                        config: Config(
                          columns: 8,
                          //  bgColor: Color.fromARGB(255, 234, 248, 255),
                          emojiSizeMax: 32 *
                              (foundation.defaultEmojiSet == TargetPlatform.iOS
                                  ? 1.30
                                  : 1.0),
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
