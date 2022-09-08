import 'dart:html';

import 'package:addressbook_app/pages/newcontact_page.dart';
import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/contact_model.dart';
import 'contact_details_page.dart';

class ContactListPage extends StatefulWidget {
static const routeName = "/";
const ContactListPage({Key? key}) : super(key: key);

@override
State<ContactListPage> createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ContactList")),
      body: PageTransitionSwitcher(
          transitionBuilder: (Widget child, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
          child: ListView.builder(
            itemCount: contactListData.length,
            itemBuilder: (context, index) => OpenContainer(
                closedElevation: 0,
                closedColor: Colors.white10,
                openColor: Colors.deepOrange,
                openElevation: 0,
                transitionDuration: Duration(seconds: 1),
                closedBuilder: (context, closeContainer) {
                  return Card(
                      shadowColor: Colors.deepOrange.withOpacity(0.3),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        onTap:closeContainer,
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: contactListData[index].image == null
                              ? (contactListData[index].gender == "Female"
                              ? Image.asset("assets/images/female.png",
                              height: 50, width: 50, fit: BoxFit.cover)
                              : Image.asset("assets/images/male.png",
                              height: 50, width: 50, fit: BoxFit.cover))
                              : Image.file(
                              File(contactListData[index].image.toString()),
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover),
                        ),
                        title: Text(
                          contactListData[index].name,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                              wordSpacing: 1),
                        ),
                      ));
                },
                openBuilder: (context, OpenContainer){


                  return  ContactDetailsPage(
                    index: index,
                    contact: contactListData[index],
                  );

                }),
          )),
      floatingActionButton: OpenContainer(
          transitionDuration: Duration(seconds: 1),
          closedColor: Colors.deepOrange,
          closedElevation: 0,
          closedShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          closedBuilder: (context, openWidget()) {
            return FloatingActionButton(
              elevation: 0,
              onPressed: () async {
                await openWidget();
                setState(() {});
              },
              child: Icon(Icons.add),
            );
          },
          openBuilder: (context, closeWidget) {
            return NewContactPage();
          }),
    );
  }
  
  Future<bool?> showConfirmationDialog() {
    return showDialog(context: context, builder: builder)
  }
}
