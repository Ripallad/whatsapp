import 'package:flutter/material.dart';

class status extends StatelessWidget {
  const status({super.key});

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/p1.jpeg"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(60),
                      color: Colors.yellow),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "My status",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Tap to add status update",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 130, 123, 123)),
                  ),
                ],
              ),
            ],
          ),
        ),

        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 19),
          child: Text(
            "Recent",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),

        Expanded(
          child: ListView.builder(
            itemCount: 200,
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: ListTile(
                    leading: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/p2.jpeg"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(60),
                          color: Colors.yellow),
                    ),
                    title: Text("Meet"),
                    subtitle: Text("Today, 6:48pm"),
                  ));
            },
          ),
        ),
        // Expanded(child: Image.asset("assets/images/profile1.jpg")),
      ],
    ));
  }
}
