import 'package:appapi/screen/user_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/http_provider.dart';

Widget buildColumn() {
  return Column(
    children: [
      Consumer<HttpServiceProvider>(builder: ((context, value, child) {
        return Expanded(
          child: ListView.separated(
            separatorBuilder: ((context, index) => const SizedBox(
                  height: 20,
                  child: Divider(),
                )),
            itemCount: value.getUser.length,
            itemBuilder: ((context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: ((context) => UserDetailScreen(
                              id: value.getUser[index].id,
                              name: value.getUser[index].name,
                              email: value.getUser[index].email,
                              phone: value.getUser[index].phone,
                              username: value.getUser[index].username,
                              website: value.getUser[index].website))));
                },
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 30,
                    child: Text(
                      value.getUser[index].id.toString(),
                      style: const TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                  title: Text(
                    value.getUser[index].name,
                    style: const TextStyle(
                        color: Color.fromARGB(235, 29, 28, 28),
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  trailing: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: ((context) => UserDetailScreen(
                                  id: value.getUser[index].id,
                                  name: value.getUser[index].name,
                                  email: value.getUser[index].email,
                                  phone: value.getUser[index].phone,
                                  username: value.getUser[index].username,
                                  website: value.getUser[index].website))));
                    },
                    child: const Chip(
                      label: Text(
                        "more",
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.red,
                    ),
                  ),
                ),
              );
            }),
          ),
        );
      }))
    ],
  );
}
