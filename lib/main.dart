import 'package:appapi/provider/http_provider.dart';
import 'package:appapi/screen/list_screen.dart';
import 'package:appapi/screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyHomePage());
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HttpServiceProvider()),
      ],
      child: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const SearchScreen()),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(right: 20),
                child: const Icon(
                  Icons.search,
                  size: 30,
                ),
              ),
            )
          ],
          centerTitle: true,
          title: const Text(
            "users",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          backgroundColor: const Color.fromARGB(255, 230, 43, 30),
        ),
        body: buildColumn());
  }
}
