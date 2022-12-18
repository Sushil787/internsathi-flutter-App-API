import 'package:appapi/screen/user_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/http_provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back)),
          title: TextField(
            autofocus: true,
            cursorColor: Colors.white,
            controller: _controller,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "search",
              hintStyle: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onChanged: (value) {
              Provider.of<HttpServiceProvider>(context, listen: false)
                  .searchQuery(value);
            },
          ),
          backgroundColor: const Color.fromARGB(255, 230, 43, 30),
        ),
        body: Column(
          children: [
            Consumer<HttpServiceProvider>(builder: ((context, value, child) {
              return Expanded(
                child: ListView.separated(
                  separatorBuilder: ((context, index) => const SizedBox(
                        height: 20,
                        child: Divider(),
                      )),
                  itemCount: value.suggestionList.length,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: ((context) => UserDetailScreen(
                                    id: value.suggestionList[index].id,
                                    name: value.suggestionList[index].name,
                                    email: value.suggestionList[index].email,
                                    phone: value.suggestionList[index].phone,
                                    username:
                                        value.suggestionList[index].username,
                                    website:
                                        value.suggestionList[index].website))));
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 30,
                          child: Text(
                            value.suggestionList[index].id.toString(),
                            style: const TextStyle(
                                fontSize: 25, color: Colors.white),
                          ),
                        ),
                        title: Text(
                          value.suggestionList[index].name,
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
                                        id: value.suggestionList[index].id,
                                        name: value.suggestionList[index].name,
                                        email:
                                            value.suggestionList[index].email,
                                        phone:
                                            value.suggestionList[index].phone,
                                        username: value
                                            .suggestionList[index].username,
                                        website: value
                                            .suggestionList[index].website))));
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
        ),
      ),
    );
  }
}
