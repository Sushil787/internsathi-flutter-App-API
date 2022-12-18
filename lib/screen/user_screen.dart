import 'package:flutter/material.dart';

class UserDetailScreen extends StatelessWidget {
  UserDetailScreen(
      {super.key,
      required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.username,
      required this.website});
  int id;
  String name;
  String username;
  String email;
  String phone;
  String website;

  @override
  Widget build(BuildContext context) {
    final globalHeight = MediaQuery.of(context).size.height;
    final globalWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        title: const Text(
          "User details",
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.navigate_before,
              size: 35,
            )),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.red,
                radius: 50,
                child: Text(
                  id.toString(),
                  style: const TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
              buildDetail(globalHeight, globalWidth, "name", name),
              buildDetail(globalHeight, globalWidth, "username", username),
              buildDetail(globalHeight, globalWidth, "email", email),
              buildDetail(globalHeight, globalWidth, "phone", phone),
              buildDetail(globalHeight, globalWidth, "website", website),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildDetail(globalHeight, globalWidth, String type, String value) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 40),
    height: globalHeight * 0.1,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          type,
          style: const TextStyle(
              fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
        ),
        Container(
          height: globalHeight * 0.05,
          width: globalWidth * 0.8,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(
              width: 1,
              color: const Color.fromARGB(255, 204, 101, 101),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              value,
              style: const TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    ),
  );
}
