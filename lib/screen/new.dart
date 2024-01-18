// import 'package:flutter/material.dart';

// class chat1 extends StatelessWidget {
//   const chat1({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 80,
//         backgroundColor: Color.fromARGB(255, 4, 86, 4),
//         leadingWidth: 30,
//         leading: InkWell(
//           onTap: () => Navigator.pop(context),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Icon(
//               Icons.arrow_back,
//               color: Colors.white,
//             ),
//           ),
//         ),
//         // padding: const EdgeInsets.all(15.0),
//         title: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Container(
//               width: 50,
//               height: 50,
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                       image: AssetImage("assets/images/p1.jpeg"),
//                       fit: BoxFit.cover),
//                   borderRadius: BorderRadius.circular(50),
//                   color: Colors.blue),
//             ),
//             SizedBox(
//               width: 10,
//             ),
//             Column(
//               children: [
//                 Text(
//                   "Ripal",
//                   style: TextStyle(color: Colors.white, fontSize: 20),
//                 ),
//                 Text(
//                   "online",
//                   style: TextStyle(color: Colors.white, fontSize: 15),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         actions: [
//           Icon(
//             Icons.videocam,
//             color: Colors.white,
//             size: 30,
//           ),
//           SizedBox(
//             width: 20,
//           ),
//           InkWell(
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => chat1(),
//                   ));
//             },
//             child: Icon(
//               Icons.call,
//               color: Colors.white,
//               size: 25,
//             ),
//           ),
//           SizedBox(
//             width: 10,
//           ),
//           PopupMenuButton<String>(
//               onSelected: (value) {
//                 print(value);
//               },
//               color: Colors.white,
//               itemBuilder: (BuildContext context) {
//                 return [
//                   PopupMenuItem(
//                     child: Text("View contact"),
//                     value: "View contact",
//                   ),
//                   PopupMenuItem(
//                     child: Text("Media, links, and docs"),
//                     value: "Media, links, and docs",
//                   ),
//                   PopupMenuItem(
//                     child: Text("WhatApp web"),
//                     value: "WhatApp web",
//                   ),
//                   PopupMenuItem(
//                     child: Text("Search"),
//                     value: "Search",
//                   ),
//                   PopupMenuItem(
//                     child: Text("Mute Notification"),
//                     value: "Mute Notification",
//                   ),
//                   PopupMenuItem(
//                     child: Text("Wallpaper"),
//                     value: "Wallpaper",
//                   ),
//                 ];
//               })
//         ],
//       ),
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         child: Stack(
//           children: [
//             //ListView(),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Row(
//                 children: [
//                   Container(
//                       width: MediaQuery.of(context).size.width - 60,
//                       child: Card(
//                           margin: EdgeInsets.only(left: 2, right: 2, bottom: 8),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(25),
//                           ),
//                           child: TextFormField(
//                             textAlignVertical: TextAlignVertical.center,
//                             keyboardType: TextInputType.multiline,
//                             maxLines: 5,
//                             minLines: 1,
//                             decoration: InputDecoration(
//                               border: InputBorder.none,
//                               hintText: "Type a message",
//                               prefixIcon: IconButton(
//                                 onPressed: () {},
//                                 icon: Icon(Icons.emoji_emotions),
//                               ),
//                               suffixIcon: Row(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   IconButton(
//                                     onPressed: () {},
//                                     icon: Icon(Icons.attach_file),
//                                   ),
//                                   IconButton(
//                                     onPressed: () {},
//                                     icon: Icon(Icons.camera_alt),
//                                   ),
//                                 ],
//                               ),
//                               contentPadding: EdgeInsets.all(5),
//                             ),
//                           ))),
//                   Padding(
//                     padding:
//                         const EdgeInsets.only(bottom: 8, right: 5, left: 3),
//                     child: CircleAvatar(
//                       radius: 25,
//                       backgroundColor: Color(0xFF128c7E),
//                       child: IconButton(
//                         onPressed: () {},
//                         icon: Icon(Icons.mic),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Widget chat(context) {
//   return Container(
//     color: Colors.white,
//     height: 80,
//     width: MediaQuery.of(context).size.width,
//     child: Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Align(
//         alignment: Alignment.bottomCenter,
//         child: Row(
//           children: [
//             Expanded(
//               child: Container(
//                   // width: MediaQuery.of(context).size.width - 60,
//                   child: Card(
//                       margin: EdgeInsets.only(left: 2, right: 2, bottom: 8),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(25),
//                       ),
//                       child: TextFormField(
//                         textAlignVertical: TextAlignVertical.center,
//                         keyboardType: TextInputType.multiline,
//                         maxLines: 5,
//                         minLines: 1,
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           hintText: "Type a message",
//                           prefixIcon: IconButton(
//                             onPressed: () {},
//                             icon: Icon(Icons.emoji_emotions),
//                           ),
//                           suffixIcon: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               IconButton(
//                                 onPressed: () {
//                                   showModalBottomSheet(
//                                       backgroundColor: Colors.transparent,
//                                       context: context,
//                                       builder: (builder) => bottomsheet());
//                                 },
//                                 icon: Icon(Icons.attach_file),
//                               ),
//                               IconButton(
//                                 onPressed: () {},
//                                 icon: Icon(Icons.camera_alt),
//                               ),
//                             ],
//                           ),
//                           contentPadding: EdgeInsets.all(5),
//                         ),
//                       ))),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 8, right: 5, left: 5),
//               child: CircleAvatar(
//                 radius: 20,
//                 backgroundColor: Color(0xFF128c7E),
//                 child: IconButton(
//                   onPressed: () {},
//                   icon: Icon(Icons.mic),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }

// bottomsheet() {}
