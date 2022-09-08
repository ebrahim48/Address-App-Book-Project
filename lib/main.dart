import 'dart:js';
import 'package:addressbook_app/pages/contact_details_page.dart';
import 'package:addressbook_app/pages/contact_list.dart';
import 'package:addressbook_app/pages/newcontact_page.dart';
import 'package:addressbook_app/providers/contact_provider.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      initialRoute: ContactListPage.routeName,
      routes: {
        ContactListPage.routeName :(context) => ContactListPage(),
        NewContactPage.routeName :(context) => NewContactPage(),
      },
    );
  }
}


