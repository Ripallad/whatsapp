import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp/Controllers/loginController.dart';
import 'package:whatsapp/models/chatuserModel.dart';
import 'package:whatsapp/models/groupMessage.dart';
import 'package:whatsapp/models/groupModel.dart';
import 'package:whatsapp/models/messageModel.dart';
import 'package:whatsapp/screen/homescreen.dart';

class HomeController extends GetxController {
  RxString enteredMessage = ''.obs;

  RxString msgImage = ''.obs;

  RxBool showemoji = false.obs;

  RxList totalmembers = [].obs;

  RxList selectedMembers = [].obs;
  RxBool stopNotification = false.obs;
  RxBool chatlock = false.obs;

  manageSelectedMembers(chatuser) {
    if (selectedMembers.contains(chatuser)) {
      selectedMembers.remove(chatuser);
    } else {
      selectedMembers.add(chatuser);
    }

    print(selectedMembers.value);
  }

  addRemoveMember(index) {
    if (selectedMembers.any((element) => element.id == index.id)) {
      selectedMembers.removeWhere((element) => element.id == index.id);
    } else {
      selectedMembers.add(index);
    }
    print(index);
  }

  void updateEntermassage(String message) {
    enteredMessage.value = message;
  }

  Future pickGalleryImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    } else {
      msgImage.value = image.path;
      return image.path;
    }
  }

  pickCameraImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) {
      return;
    } else {
      msgImage.value = image.path;
      return image.path;
    }
  }

  sendImagesFromGallery(oppuser) {
    pickGalleryImage().then((value) async {
      final time = DateTime.now().millisecondsSinceEpoch.toString();
      logincontroller
          .storeDataInStorage(
              '/chatImages/${logincontroller.loginuser.value?.id}_$time',
              File(msgImage.value))
          .then((image) {
        sendmessage(oppuser, image, Type.image);
      });
    });
  }

  sendImagesFromCamera(oppuser) {
    pickCameraImage().then((value) async {
      final time = DateTime.now().millisecondsSinceEpoch.toString();
      logincontroller
          .storeDataInStorage(
              '/chatImages/${logincontroller.loginuser.value?.id}_$time',
              File(msgImage.value))
          .then((image) {
        sendmessage(oppuser, image, Type.image);
      });
    });
  }

  final logincontroller = Get.put(Logincontroller());
  sendmessage(ChatUser oppUser, mymessage, Type type) async {
    var time = DateTime.now().millisecondsSinceEpoch.toString();
    final message = Message(
        fromId: logincontroller.loginuser.value!.id,
        toId: oppUser.id,
        sendTime: time,
        message: mymessage,
        read: '',
        type: type);

    final ref = logincontroller.firestore
        .collection("chats/${generateChatId(oppUser)}/messages/");

    await ref
        .doc(time)
        .set(message.toMap())
        .then((value) => enteredMessage.value == '');
  }

  generateChatId(ChatUser oppuser) {
    final oppid = oppuser.id.hashCode;
    final uid = logincontroller.loginuser.value?.id.hashCode;
    if (uid != null) {
      return oppid <= uid ? '${oppid}_${uid}' : '${uid}_${oppid}';
    }
    return null;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getMessages(oppUser) {
    return logincontroller.firestore
        .collection('chats/${generateChatId(oppUser)}/messages/')
        .snapshots();
  }

  String getFormatedDate(
      {required BuildContext context, required String time}) {
    final date = DateTime.fromMillisecondsSinceEpoch(int.parse(time));
    final formattedtime = TimeOfDay.fromDateTime(date).format(context);

    return formattedtime;
  }

  String getLastSeen({required BuildContext context, required String time}) {
    final date = DateTime.fromMillisecondsSinceEpoch(int.parse(time));
    final formattedtime = TimeOfDay.fromDateTime(date).format(context);
    final today = DateTime.now();
    print(formattedtime);
    if (today.day == date.day &&
        today.month == date.month &&
        today.year == date.year) {
      return 'Last seen today at $formattedtime';
    }

    if (today.difference(date).inHours / 24 == 1) {
      return 'Last seen yesterday at $formattedtime';
    }
    if (today.year == date.year) {
      final dt = 'Last seen on ${date.day} ${getMonth(date)} at $formattedtime';
      return dt;
    }
    print(date.year);
    final yearly =
        'Last seen on ${date.day} ${getMonth(date)} ${date.year} at $formattedtime';
    return yearly;
  }

  getMonth(DateTime date) {
    switch (date.month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
    }
    return 'NA';
  }

  void updateEnteredMessage(String message) {
    enteredMessage.value = message;
  }

  //group function
  Stream<QuerySnapshot<Map<String, dynamic>>> getSingleUser(userid) {
    return logincontroller.firestore
        .collection('users')
        .where('id', isEqualTo: '$userid')
        .snapshots();
  }

  List<String> finalList = [];
  List<String> adminList = [];
  getFinalGroupList(String loginid) {
    finalList = [];
    adminList = [];
    finalList.add(loginid);
    adminList.add(loginid);
    for (var i = 0; i < selectedMembers.length; i++) {
      finalList.add(selectedMembers[i].id);
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getGroupMessages(group) {
    return logincontroller.firestore
        .collection('groupchats/${group.groupId}/messages/')
        .snapshots();
  }

  sendGroupImagesFromCamera(Group group) {
    pickCameraImage().then((value) async {
      final time = DateTime.now().millisecondsSinceEpoch.toString();
      logincontroller
          .storeDataInStorage(
              '/groupchatImages/${group.groupId}_$time', File(msgImage.value))
          .then((image) {
        sendGroupMessage(group, image, GType.Image);
      });
    });
  }

  sendGroupMessage(Group group, mymessage, GType type) async {
    var time = DateTime.now().millisecondsSinceEpoch.toString();

    final message = GroupMessage(
        fromId: logincontroller.loginuser.value!.id,
        toId: group.groupId,
        sendTime: time,
        message: mymessage,
        type: type);

    final ref = logincontroller.firestore
        .collection("groupchats/${group.groupId}/messages/");

    await ref
        .doc(time)
        .set(message.toMap())
        .then((value) => enteredMessage.value == '');
  }

  addNewGroup(String groupname, File groupImage) async {
    var time = DateTime.now().millisecondsSinceEpoch.toString();

    await logincontroller
        .storeDataInStorage('groupProfile/${groupname}', groupImage)
        .then((url) {
      var group = Group(
          groupName: groupname,
          groupId: '${groupname}_$time',
          members: finalList,
          createdAt: time,
          admins: adminList,
          image: url);

      logincontroller.firestore
          .collection('groups')
          .doc('${groupname}_$time')
          .set(group.toMap())
          .then((value) => Get.offAll(homescreen()));

      selectedMembers.clear();
      finalList.clear();
      logincontroller.selectedProfile.value = '';
      adminList.clear();
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getGroupImages(Group group) {
    return logincontroller.firestore
        .collection('groupchats/${group.groupId}/messages')
        .snapshots();
  }
}
