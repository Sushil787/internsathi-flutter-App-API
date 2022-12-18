import 'dart:convert';
import 'package:appapi/model/user_mode.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class HttpServiceProvider extends ChangeNotifier {
  HttpServiceProvider() {
    fetchData();
  }
  List<dynamic> suggestionList = [];
  List<dynamic> dummyList = [];
  List<dynamic> _userList = [];
  List<dynamic> get getUser => _userList;
  Uri baseUri = Uri.parse("https://jsonplaceholder.typicode.com/users");
  Future fetchData() async {
    var response = await http.get(baseUri);
    if (response.statusCode == 200) {
      List<dynamic> users = jsonDecode(response.body)
          .map((dynamic bodyResponse) => UserModel.fromJson(bodyResponse))
          .toList();
      _userList = users;
      dummyList = users;
      notifyListeners();
    }
  }

  void searchQuery(String query) {
    if (query.isEmpty) {
      suggestionList = _userList;
      notifyListeners();
    } else if (query.isNotEmpty) {
      suggestionList = _userList
          .where((element) =>
              element.name.toString().toLowerCase().contains(query))
          .toList();

      notifyListeners();
    }
  }
}
