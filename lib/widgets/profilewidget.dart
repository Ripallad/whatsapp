import 'package:flutter/material.dart';

Widget ProfileWidget(context, controller, title, subtitle, leadingIcon) {
  return ListTile(
    visualDensity: VisualDensity.compact,
    leading: Icon(leadingIcon,
        size: MediaQuery.of(context).size.width * 0.06,
        color: Colors.grey.shade600),
    title: Text(title),
    titleTextStyle: TextStyle(color: Colors.grey.shade600, fontSize: 13),
    subtitle: Center(
      child: TextFormField(
        controller: controller,
        style: TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        cursorHeight: 15,
        decoration: InputDecoration(
          hintText: subtitle,
          hintStyle: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 19, color: Colors.black),
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    ),
    trailing: Icon(
      Icons.edit,
      size: MediaQuery.of(context).size.width * 0.06,
      color: Color(0xff128C7E),
    ),
  );
}

Widget ProfileContainer(icon, text, context) {
  return Container(
    height: MediaQuery.of(context).size.width / 5.5,
    width: MediaQuery.of(context).size.width / 5,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 0.5, color: Colors.grey.shade300)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, color: Color.fromARGB(255, 4, 86, 4)),
        Text(text, style: TextStyle(fontSize: 13))
      ],
    ),
  );
}

Widget listtile(text, icon) {
  return ListTile(
    contentPadding: EdgeInsets.only(left: 15, right: 10),
    visualDensity: VisualDensity.compact,
    leading: Icon(icon, color: Colors.grey.shade600),
    title: Text(text),
    titleTextStyle: TextStyle(fontSize: 15, color: Colors.black),
  );
}
