import 'package:flutter/material.dart';
import 'package:whatsapp/screen/loginscreen.dart';

class listview extends StatelessWidget {
  const listview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("ListView"),
      ),
      body: Column(children: [
        Expanded(
            child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListTile(
                leading: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/p1.jpeg"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(80),
                      color: Colors.yellow),
                ),
                // leading: Icon(Icons.home),
                title: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Ripal",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      // title: Text("Contact $index"),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Hello",
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ),
                trailing: Text("12:50 am"),
                // subtitle: Text("8234567534"),
                // trailing: Icon(Icons.arrow_forward),
              ),
            );
          },
        )),
      ]),
    );
  }
}
