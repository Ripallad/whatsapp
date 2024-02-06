import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:whatsapp/Controllers/loginController.dart';

class phone extends StatelessWidget {
  const phone({super.key});

  @override
  Widget build(BuildContext context) {
    final logincontroller = Get.put(Logincontroller());
    var mobileController = TextEditingController();
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 75, left: 73),
              child: Row(
                children: [
                  "Enter your phone number"
                      .text
                      .size(23)
                      .fontWeight(FontWeight.w500)
                      .make(),
                  10.widthBox,
                  Icon(
                    Icons.more_vert,
                    size: 30,
                  )
                ],
              ),
            ),
            35.heightBox,
            "WhatsApp will need to verify your phone number"
                .text
                .size(15)
                .fontWeight(FontWeight.w400)
                .make(),
            5.heightBox,
            " What’s  my number?"
                .text
                .size(17)
                .color(Color.fromARGB(255, 12, 110, 196))
                .make(),
            70.heightBox,
            Container(
                width: 200,
                child: TextFormField(
                  controller: mobileController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(focusColor: Colors.green),
                )),
            10.heightBox,
            " Carrier charges may apply".text.make(),
            150.heightBox,
            InkWell(
              onTap: () {
                if (mobileController.text == '')
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please Enter mobile no")));
                {}
                if (mobileController.length < 10) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Please Enter 10 Digit mobile no")));
                } else {
                  logincontroller.verifyphonenumber(
                      "+91", mobileController.text, context);
                }
              },
              child: Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(30)),
                child: "NEXT"
                    .text
                    .white
                    .size(15)
                    .fontWeight(FontWeight.w600)
                    .makeCentered(),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
