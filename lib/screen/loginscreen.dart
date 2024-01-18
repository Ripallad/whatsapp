import 'package:flutter/material.dart';
import 'package:whatsapp/screen/signup.dart';
// import 'package:whatsapp/screens/signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

GlobalKey<FormState> _formkey = GlobalKey<FormState>();

GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

var nameController = TextEditingController();
var passController = TextEditingController();
var mobileController = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    // var myConterollor = TextEditingController();
    return Scaffold(
      key: _globalKey,
      backgroundColor: Color.fromARGB(255, 119, 169, 211),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Login",
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.green,
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                //currentAccountPictureSize: Size(60, 60),
                //otherAccountsPicturesSize: Size(60, 60),

                decoration: BoxDecoration(
                    color: Colors.green,
                    border: Border(bottom: BorderSide.none)),
                accountName: Text("Name"),
                accountEmail: Text("email123@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("assets/images/p1.jpeg"),
                ),
                otherAccountsPictures: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("assets/images/p2.jpeg"),
                  ),
                ],
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Home"),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text("Inbox"),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Setting"),
              ),
              ListTile(
                leading: Icon(Icons.history),
                title: Text("History"),
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Logout"),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text("Inbox"),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Setting"),
              ),
              ListTile(
                leading: Icon(Icons.history),
                title: Text("History"),
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Logout"),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text("Inbox"),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Setting"),
              ),
              ListTile(
                leading: Icon(Icons.history),
                title: Text("History"),
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Logout"),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () {
                      _globalKey.currentState!.openDrawer();
                    },
                    child: Icon(Icons.menu)),
                Container(
                  height: 440,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // border: Border.all(
                    //   width: 2,
                    // ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Form(
                      key: _formkey,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "LOGIN",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: nameController,
                              onChanged: (value) {},
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter name";
                                }
                                return null;
                              },
                              //  controller: myConterollor,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.grey),
                              // textDirection: TextDirection.rtl,
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  hintText: "Enter Your Name",
                                  hintStyle: TextStyle(
                                      color:
                                          Color.fromARGB(255, 174, 160, 160)),
                                  label: Text("Name")),

                              // decoration: InputDecoration(
                              //     enabledBorder: UnderlineInputBorder(
                              //       borderSide: BorderSide(color: Colors.red),
                              //     ),
                              //     focusedBorder: UnderlineInputBorder(
                              //         borderSide: BorderSide(color: Colors.green))),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.phone,
                              controller: mobileController,
                              onChanged: (value) {},
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter mobile no";
                                } else {
                                  if (value.length != 10) {
                                    return "Mobile no length should be 10";
                                  }
                                }
                                return null;
                              },
                              //  controller: myConterollor,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.grey),
                              // textDirection: TextDirection.rtl,
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  hintText: "Enter Your Mobile no.",
                                  hintStyle: TextStyle(
                                      color:
                                          Color.fromARGB(255, 174, 160, 160)),
                                  label: Text("Mobile")),

                              // decoration: InputDecoration(
                              //     enabledBorder: UnderlineInputBorder(
                              //       borderSide: BorderSide(color: Colors.red),
                              //     ),
                              //     focusedBorder: UnderlineInputBorder(
                              //         borderSide: BorderSide(color: Colors.green))),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: passController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "enter password";
                                }
                                return null;
                              },
                              // onChanged: (value) {
                              //   if (myConterollor.text.length > 10)
                              //     print("length should be less than 10");
                              // },
                              // controller: myConterollor,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.grey),
                              // textDirection: TextDirection.rtl,
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  hintText: "Enter Your Password",
                                  hintStyle: TextStyle(
                                      color:
                                          Color.fromARGB(255, 174, 160, 160)),
                                  label: Text("Password")),
                              obscureText: true,

                              // decoration: InputDecoration(
                              //     enabledBorder: UnderlineInputBorder(
                              //       borderSide: BorderSide(color: Colors.red),
                              //     ),
                              //     focusedBorder: UnderlineInputBorder(
                              //         borderSide: BorderSide(color: Colors.green))),
                            ),
                            // TextFormField(
                            //   // minLines: 5,
                            //   // maxLines: 6,
                            //   //showCursor: false,
                            //   cursorColor: Colors.amber,

                            //   keyboardType: TextInputType.datetime,
                            //   obscureText: true,
                            //   decoration: InputDecoration(
                            //     label: Padding(
                            //       padding: const EdgeInsets.all(10.0),
                            //       child: Text("Password"),
                            //     ),
                            //   ),
                            // ),
                            SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: () {
                                // if (myConterollor.text.length != 10) {
                                //   print("Invalid ");
                                // } else {
                                //   Navigator.pop(context);
                                // }
                              },
                              child: InkWell(
                                onTap: () {
                                  if (_formkey.currentState!.validate()) {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => signup(),
                                    ));
                                  }
                                },
                                child: Container(
                                  height: 40,
                                  // width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: Colors.pink,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text(
                                      "LOGIN",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:whatsapp/screen/signup.dart';

// class Loginscreen extends StatelessWidget {
//   const Loginscreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var myConterollor;
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 145, 199, 244),
//       appBar: AppBar(
//         title: Text(
//           "Login",
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.green,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//         child: Center(
//           child: Container(
//             height: 350,
//             decoration: BoxDecoration(
//               color: Colors.white, borderRadius: BorderRadius.circular(10),
//               // border: Border.all(width: 2),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Text(
//                       "Login",
//                       style:
//                           TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   TextFormField(
//                     // onChanged: (value) {
//                     //   var myConterollor;
//                     //   if (myConterollor.text.length > 10) ;
//                     //   print("length should be less than 10");
//                     // },
//                     // controller: myConterollor,
//                     style: TextStyle(fontSize: 20, color: Colors.grey),
//                     // textDirection: TextDirection.rtl,
//                     textAlign: TextAlign.start,
//                     decoration: InputDecoration(
//                         filled: true,
//                         fillColor: const Color.fromARGB(255, 255, 251, 251),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.grey),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.grey),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         hintText: "Enter Your Name",
//                         hintStyle: TextStyle(color: Colors.black),
//                         label: Text("Name")),

//                     // decoration: InputDecoration(
//                     //     enabledBorder: UnderlineInputBorder(
//                     //       borderSide: BorderSide(color: Colors.red),
//                     //     ),
//                     //     focusedBorder: UnderlineInputBorder(
//                     //         borderSide: BorderSide(color: Colors.green))),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   TextFormField(
//                     // onChanged: (value) {
//                     //   var myConterollor;
//                     //   if (myConterollor.text.length > 10)
//                     //     print("length should be less than 10");
//                     // },
//                     // controller: myConterollor,
//                     style: TextStyle(fontSize: 20, color: Colors.grey),
//                     // textDirection: TextDirection.rtl,
//                     textAlign: TextAlign.start,
//                     decoration: InputDecoration(
//                         filled: true,
//                         fillColor: const Color.fromARGB(255, 255, 251, 251),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.grey),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.grey),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         hintText: "Enter Your Password",
//                         hintStyle: TextStyle(color: Colors.black),
//                         label: Text("Password")),
//                     obscureText: true,

//                     // decoration: InputDecoration(
//                     //     enabledBorder: UnderlineInputBorder(
//                     //       borderSide: BorderSide(color: Colors.red),
//                     //     ),
//                     //     focusedBorder: UnderlineInputBorder(
//                     //         borderSide: BorderSide(color: Colors.green))),
//                   ),
//                   // TextFormField(
//                   //   // minLines: 5,
//                   //   // maxLines: 6,
//                   //   showCursor: true,
//                   //   // cursorColor: Colors.amber,

//                   //   keyboardType: TextInputType.datetime,
//                   //   obscureText: true,
//                   //   decoration: InputDecoration(
//                   //     label: Padding(
//                   //       padding: const EdgeInsets.all(10.0),
//                   //       child: Text("Password"),
//                   //     ),
//                   //   ),
//                   // ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   InkWell(
//                     onTap: () {
//                       if (myConterollor.text.length != 10) {
//                         print("Invalid ");
//                       } else {
//                         Navigator.pop(context);
//                       }
//                     },
//                     child: InkWell(
//                       onTap: () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) => signup(),
//                         ));
//                       },
//                       child: Container(
//                         height: 40,
//                         // width: MediaQuery.of(context).size.width,
//                         decoration: BoxDecoration(
//                             color: Color.fromARGB(255, 244, 101, 91),
//                             borderRadius: BorderRadius.circular(10)),
//                         child: Center(
//                             child: Text("Login",
//                                 style: TextStyle(color: Colors.white))),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
