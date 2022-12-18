// import 'package:contacts_service/contacts_service.dart';
// import 'package:flutter/widgets.dart';
// import 'package:permission_handler/permission_handler.dart';

// class ContactProvider extends ChangeNotifier {
//   static List<Contact> contactList = [];
//   void getPermission() async {
//     if (await Permission.contacts.isGranted) {
//       fetchData();
//     } else {
//       await Permission.contacts.request();
//     }
//   }

//   void fetchData() async {
//     List<Contact> contact = await ContactsService.getContacts();
//     contactList = contact;
//     suggestionList = contactList;
//     notifyListeners();
//   }

//   // List<Contact> suggestionList get => contactList;
//   // List<Contact> getContactList = suggestionList;
//   // static List<Contact> suggestionList = [];
//   List<Contact> suggestionList = contactList;

//   void searchQuery(String query) {
//     if (query.isEmpty) {
//       suggestionList = contactList;
//       notifyListeners();
//     } else if (query.isNotEmpty) {
//       suggestionList = contactList
//           .where((element) =>
//               element.displayName.toString().toLowerCase().contains(query))
//           .toList();

//       notifyListeners();
//     }
//   }
// }
