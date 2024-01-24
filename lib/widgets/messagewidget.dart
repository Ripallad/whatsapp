import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/models/messageModel.dart';

Widget ReceiveMessageWidget(contex,Message message) {
  return Align(
    alignment: Alignment.bottomLeft,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            child: ClipPath(
              clipper: UpperNipMessageClipperTwo(MessageType.receive),
              child: Container(
                padding:
                    EdgeInsets.only(top: 10, right: 10, left: 25, bottom: 10),
                decoration: BoxDecoration(color: Colors.white),
                child: Text(
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
            child: ClipPath(
              clipper: UpperNipMessageClipperTwo(MessageType.send),
              child: Container(
                padding:
                    EdgeInsets.only(top: 10, right: 25, left: 10, bottom: 10),
                decoration: BoxDecoration(color: Colors.white),
                child: Text(
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
