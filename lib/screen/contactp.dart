import 'package:flutter/material.dart';
import 'package:get/get.dart';


class contactprofile extends StatelessWidget {
  const contactprofile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: Get.height * 0.37,
              width: Get.width * 0.78,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/empty_user.jpg')),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(200)),
              // child: Text('Meet Dhanger'),
              // child: Image.asset(
              //   'assets/images/whatsapp.png',
              //   fit: BoxFit.fill,
              // ),
            ),
          )
        ],
      ),
    );
  }
}
