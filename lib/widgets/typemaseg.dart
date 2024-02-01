import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp/Controllers/homeController.dart';

Widget bottomsheet(oppuser) {
  final controller = Get.put(HomeController());
  return Container(
    height: 278,
    width: 400,
    child: Card(
      margin: EdgeInsets.all(18),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconcreation(
                    Icons.insert_drive_file, Colors.indigo, "Documents", () {}),
                SizedBox(
                  width: 40,
                ),
                iconcreation(Icons.camera_alt, Colors.pink, "Camera", () {
                  Get.back();
                  controller.sendImagesFromCamera(oppuser);
                }),
                SizedBox(
                  width: 40,
                ),
                iconcreation(Icons.insert_photo, Colors.purple, "Gallary", () {
                  Get.back();
                  controller.sendImagesFromGallery(oppuser);
                }),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconcreation(Icons.headset, Colors.orange, "Audio", () {}),
                SizedBox(
                  width: 40,
                ),
                iconcreation(
                    Icons.location_pin, Colors.teal, "Location", () {}),
                SizedBox(
                  width: 40,
                ),
                iconcreation(Icons.person, Colors.blue, "Contact", () {}),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

iconcreation(IconData icon, MaterialColor color, String text, ontap) {
  return InkWell(
    onTap: ontap,
    child: Column(
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 30,
          child: Icon(
            icon,
            size: 29,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    ),
  );
}
