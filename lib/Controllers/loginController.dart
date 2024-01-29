import 'dart:developer';

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp/models/chatuserModel.dart';
import 'package:whatsapp/screen/addnewuser.dart';

import 'package:whatsapp/screen/homescreen.dart';
import 'package:whatsapp/screen/otp.dart';
import 'package:whatsapp/screen/phone.dart';

class Logincontroller extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  FirebaseStorage storage = FirebaseStorage.instance;

  RxString verId = ''.obs;

  RxBool obxcheck = false.obs;

  Rx<ChatUser?> loginuser = Rx<ChatUser?>(null);

  Future<bool> checkUserExist() async {
    return (await firestore
            .collection('users')
            .doc('${auth.currentUser?.phoneNumber}')
            .get())
        .exists;
  }
  //G0jG89vwwhE1NuxENZuU

  checkUserLogin() {
    var user = auth.currentUser;
    print(user?.phoneNumber);
    if (user == null) {
      Get.offAll(() => phone());
    } else {
      //Get.offAll(() => homescreen());
      getUsersData().then((value) => Get.offAll(homescreen()));
    }
  }

  userlogout() {
    auth.signOut();
    updateActiveStatus(false);
    Get.offAll(() => phone());
  }

  verifyMobileNumber(contrycode, mobilenumber, context) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '${contrycode + mobilenumber}',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Invalid Mobile number")));
        } else {
          print("Eroor");
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        verId.value = verificationId;
      },
      timeout: const Duration(seconds: 120),
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => otp(),
        ),
        (route) => false);
  }

  verifyOtp(code) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verId.value, smsCode: code);

      await auth
          .signInWithCredential(credential)
          .then((auth) => checkUserExist().then((check) {
                if (check == true) {
                  getUsersData().then((value) => Get.offAll(homescreen()));
                  // Get.offAll(() => homescreen());
                } else {
                  Get.offAll(() => Addnewuser());
                }
              }));
    } catch (e) {
      log(e.toString());
    }
  }

  Future<bool> getUsersData() async {
    await firestore
        .collection('users')
        .doc('${auth.currentUser!.phoneNumber}')
        .get()
        .then(
          (DocumentSnapshot snapshot) => loginuser.value = ChatUser(
            isActive: snapshot['is_active'],
            lastSeen: snapshot['last_seen'],
            phone: snapshot['phone'],
            profile: snapshot['profile'],
            about: snapshot['about'],
            name: snapshot['name'],
            id: snapshot['id'],
            createAt: snapshot['create_at'],
          ),
        );
    return true;
  }

  Future<String> storagedataInStorage(String ref, File myfile) async {
    UploadTask task = storage.ref().child(ref).putFile(myfile);
    TaskSnapshot taskSnapshot = await task;
    String url = await taskSnapshot.ref.getDownloadURL();
    return url;
  }

  addnewuser(String name, File myfile) async {
    await storagedataInStorage(
            'profileImage/${auth.currentUser!.phoneNumber}', myfile)
        .then((url) {
      final time = DateTime.now().microsecondsSinceEpoch.toString();
      final user = ChatUser(
          isActive: false,
          lastSeen: time,
          phone: '${auth.currentUser!.phoneNumber}',
          profile: url,
          about: "hey,im using Whatsapp",
          name: name,
          id: '${auth.currentUser!.phoneNumber}',
          createAt: time);

      loginuser.value = user;

      firestore
          .collection('users')
          .doc('${auth.currentUser!.phoneNumber}')
          .set(user.toMap())
          .then((value) => Get.offAll(homescreen()));
    });
  }

  RxString selectedProfile = ''.obs;
  pickimage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    } else {
      selectedProfile.value = image.path;
      return image.path;
    }
  }

  updateuserdata(String username, String userabout, String image) async {
    await firestore
        .collection('users')
        .doc('${auth.currentUser!.phoneNumber}')
        .update({'name': username, 'about': userabout, 'profile': image}).then(
            (value) {
      getUsersData().then((value) {
        Get.back();
        selectedProfile.value = '';
      });
    });
  }

  updateActiveStatus(status) async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();

    await firestore
        .collection('users')
        .doc(loginuser.value?.id)
        .update({'is_active': status, 'last_seen': time});
  }
}
