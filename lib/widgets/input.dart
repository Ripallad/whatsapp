import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp/Controllers/homeController.dart';
import 'package:whatsapp/models/messageModel.dart';
import 'package:whatsapp/widgets/typemaseg.dart';

Widget chatinput(context, oppuser, controller) {
  final homecontroller = Get.find<HomeController>();
  final FocusNode _textFocusNode = FocusNode();
  return Row(
    children: [
      Expanded(
        child: Card(
            margin: EdgeInsets.only(left: 2, right: 2, bottom: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            child: TextFormField(
              onTap: () {
                if (homecontroller.showemoji.value) {
                  homecontroller.showemoji.value =
                      !homecontroller.showemoji.value;
                }
              },
              focusNode: _textFocusNode,
              controller: controller,
              onChanged: (val1) {
                homecontroller.updateEntermassage(val1.toString());
              },
              textAlignVertical: TextAlignVertical.center,
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              minLines: 1,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Type a message",
                prefixIcon: IconButton(
                  onPressed: () {
                    homecontroller.showemoji.value =
                        !homecontroller.showemoji.value;
                  },
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
                            builder: (builder) => bottomsheet(oppuser));
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
        padding: const EdgeInsets.only(bottom: 8, right: 5, left: 5),
        child: InkWell(
          onTap: () {
            if (homecontroller.enteredMessage.value != '') {
              homecontroller.sendmessage(
                  oppuser, homecontroller.enteredMessage.value, Type.text);
              controller.text = '';
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
  );
}
