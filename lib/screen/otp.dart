import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:whatsapp/Controllers/loginController.dart';


class otp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logincontroller = Get.find<Logincontroller>();
    String otp = '';
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Pinput(
              onChanged: (value) {
                otp = value;
              },
              onSubmitted: (value) {
                otp = value;
              },
              length: 6,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              try {
                logincontroller.verifyotp(otp);
              } catch (e) {
                if (otp.length < 6) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please Enter 6 Digit OTP")));
                } else {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("Invalid OTP")));
                }
              }
            },
            child: Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Text(
                  "Verify",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
