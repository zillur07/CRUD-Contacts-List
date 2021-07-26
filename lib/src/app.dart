import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'pages/contactsPage.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: new ThemeData(
        scaffoldBackgroundColor: Colors.teal[100],
      ),
      debugShowCheckedModeBanner: false,
      home: ContactsPage(),
    );
  }
}
