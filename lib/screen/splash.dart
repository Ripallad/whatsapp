import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp/Controllers/loginController.dart';


class splash extends StatelessWidget {
  const splash({super.key});

  @override
  Widget build(BuildContext context) {
    final lc = Get.put(Logincontroller());
    Timer(Duration(seconds: 2), () {
     
      lc.checkuserlogin();
    });
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 50,
                child: Image.asset(
                  "assets/images/whatsapp.png",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Text("from"),
            ],
          ),
        ),
      ),
    );
  }
}
