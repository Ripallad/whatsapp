import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp/Controllers/homeController.dart';
import 'package:whatsapp/models/chatuserModel.dart';
import 'package:whatsapp/models/groupMessage.dart';
import 'package:whatsapp/models/messageModel.dart';

Widget ReceiveMessageWidget(contex, Message message) {
  return Align(
    alignment: Alignment.bottomLeft,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            width: MediaQuery.of(contex).size.width / 1.5,
            child: ClipPath(
              clipper: UpperNipMessageClipperTwo(MessageType.receive),
              child: Container(
                padding:
                    EdgeInsets.only(top: 10, right: 10, left: 25, bottom: 10),
                decoration: BoxDecoration(color: Colors.white),
                child: message.type == Type.image
                    ? Image.network(message.message)
                    : Text(
                        '${message.message}',
                        style: TextStyle(fontSize: 17),
                      ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget SendMessageWidget(contex, Message message) {
  return Align(
    alignment: Alignment.bottomRight,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            width: MediaQuery.of(contex).size.width / 1.5,
            child: ClipPath(
              clipper: UpperNipMessageClipperTwo(MessageType.send),
              child: Container(
                padding:
                    EdgeInsets.only(top: 10, right: 25, left: 10, bottom: 10),
                decoration: BoxDecoration(color: Colors.white),
                child: message.type == Type.image
                    ? Image.network(message.message)
                    : Text(
                        '${message.message}',
                        style: TextStyle(fontSize: 17),
                      ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget groupRecieverMessageWidget(context, GroupMessage message) {
  final homecontroller = Get.find<HomeController>();
  return Align(
    alignment: Alignment.topLeft,
    child: Padding(
      padding: const EdgeInsets.only(right: 0, top: 10),
      child: Row(
        children: [
          StreamBuilder(
              stream: homecontroller.getSingleUser(message.fromId),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<ChatUser> users = [];
                  final data = snapshot.data?.docs;
                  users =
                      data?.map((e) => ChatUser.fromMap(e.data())).toList() ??
                          [];

                  return Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(users[0].profile),
                          fit: BoxFit.cover),
                      //color: Colors.amber,
                      borderRadius: BorderRadius.circular(40),
                    ),
                  );
                } else {
                  return Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(30)),
                  );
                }
              }),
          Container(
            width: MediaQuery.of(context).size.width / 1.5,
            child: ClipPath(
              clipper: UpperNipMessageClipperTwo(MessageType.receive),
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                padding:
                    EdgeInsets.only(top: 10, right: 10, left: 25, bottom: 10),
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    message.type == GType.Image
                        ? Image.network(message.message)
                        : Text(
                            '${message.message}',
                            style: TextStyle(fontSize: 17),
                          ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            homecontroller.getFormatedDate(
                              context: context,
                              time: message.sendTime,
                            ),
                            style: TextStyle(
                                color: Colors.grey.shade600, fontSize: 13),
                          ),
                          Icon(Icons.check),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget groupSenderMessageWidget(context, GroupMessage message) {
  final homecontroller = Get.find<HomeController>();
  return Align(
    alignment: Alignment.topRight,
    child: Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        child: ClipPath(
          clipper: UpperNipMessageClipperTwo(MessageType.send),
          child: Container(
            width: MediaQuery.of(context).size.width / 2,
            padding: EdgeInsets.only(top: 10, right: 20, left: 25, bottom: 10),
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                message.type == GType.Image
                    ? Image.network(message.message)
                    : Text(
                        '${message.message}',
                        style: TextStyle(fontSize: 17),
                      ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(homecontroller.getFormatedDate(
                          context: context, time: message.sendTime)),
                      Icon(Icons.check),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
