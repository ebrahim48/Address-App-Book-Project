import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../models/contact_model.dart';

class NewContactPage extends StatefulWidget {
  static const routeName = "/new-contact-page";
  const NewContactPage({Key? key}) : super(key: key);

  @override
  State<NewContactPage> createState() => _NewContactPageState();
}

class _NewContactPageState extends State<NewContactPage> {
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final streetAddressController = TextEditingController();
  final websiteController = TextEditingController();
  String groupValue = "";
  String? dateOfBirth;

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    streetAddressController.dispose();
    websiteController.dispose();
    super.dispose();
  }

  String? imagePatch;
  ImageSource source = ImageSource.camera;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Contact"),
        actions: [IconButton(onPressed: _saveContact, icon: Icon(Icons.save))],
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Stack(
              children: [
                Center(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: imagePatch == null
                          ? Image.asset(
                        "assets/images/male.png",
                        height: 100,
                        width: 100,
                        alignment: Alignment.center,
                        fit: BoxFit.cover,
                      )
                          : Image.file(
                        File(
                          imagePatch!,
                        ),
                        height: 100,
                        width: 100,
                        alignment: Alignment.center,
                        fit: BoxFit.cover,
                      )),
                ),
                Positioned(
                    bottom: 0,
                    right: (MediaQuery.of(context).size.width / 2) - 70,
                    child: IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                elevation: 10,
                                actions: [
                                  ListTile(
                                    onTap: () {
                                      source = ImageSource.camera;
                                      _getImage();
                                      Navigator.of(context).pop();
                                    },
                                    title: Icon(
                                      Icons.camera_alt_outlined,
                                      color: Colors.deepOrange,
                                    ),
                                    subtitle: Text(
                                      "Capture from camera",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Divider(),
                                  ListTile(
                                    onTap: () {
                                      source = ImageSource.gallery;
                                      _getImage();
                                      Navigator.of(context).pop();
                                    },
                                    title: Icon(
                                      Icons.photo_library_outlined,
                                      color: Colors.deepOrange,
                                    ),
                                    subtitle: Text(
                                      "Capture from Gallery",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ));
                        },
                        icon: Icon(
                          Icons.add_a_photo,
                          color: Colors.black,
                        )))
              ],
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: nameController,
              style: TextStyle(
                  color: Colors.deepOrange, fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffffe6e6),
                  contentPadding: EdgeInsets.only(left: 10),
                  focusColor: Colors.white,
                  prefixIcon: Icon(
                    Icons.account_circle_outlined,
                    color: Colors.deepOrange,
                  ),
                  hintText: "Enter your full name",
                  hintStyle: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.normal),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: mobileController,
              style: TextStyle(
                  color: Colors.deepOrange, fontWeight: FontWeight.w500),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffffe6e6),
                  contentPadding: EdgeInsets.only(left: 10),
                  focusColor: Colors.white,
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Colors.deepOrange,
                  ),
                  hintText: "Enter your mobile number",
                  hintStyle: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.normal),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: emailController,
              style: TextStyle(
                  color: Colors.deepOrange, fontWeight: FontWeight.w500),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffffe6e6),
                  contentPadding: EdgeInsets.only(left: 10),
                  focusColor: Colors.white,
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: Colors.deepOrange,
                  ),
                  hintText: "Enter your email address",
                  hintStyle: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.normal),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: websiteController,
              style: TextStyle(
                  color: Colors.deepOrange, fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffffe6e6),
                  contentPadding: EdgeInsets.only(left: 10),
                  focusColor: Colors.white,
                  prefixIcon: Icon(
                    Icons.language,
                    color: Colors.deepOrange,
                  ),
                  hintText: "Enter your website link",
                  hintStyle: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.normal),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: streetAddressController,
              style: TextStyle(
                  color: Colors.deepOrange, fontWeight: FontWeight.w500),
              maxLines: 1,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffffe6e6),
                  contentPadding: EdgeInsets.only(left: 10),
                  focusColor: Colors.white,
                  prefixIcon: Icon(
                    Icons.location_city,
                    color: Colors.deepOrange,
                  ),
                  hintText: "Enter your street address",
                  hintStyle: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.normal),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              color: Color(0xffffe6e6),
              shadowColor: Color(0xffffe6e6),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Gender:",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.all(0),
                            title: Text(
                              "Male",
                              style: TextStyle(
                                  color: groupValue == "Male"
                                      ? Colors.red
                                      : Colors.grey),
                            ),
                            leading: Radio<String>(
                                value: "Male",
                                groupValue: groupValue,
                                fillColor: MaterialStateColor.resolveWith(
                                        (states) => groupValue == "Male"
                                        ? Colors.red
                                        : Colors.grey),
                                onChanged: (value) {
                                  setState(() {
                                    groupValue = value as String;
                                  });
                                }),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.all(0),
                            title: Text(
                              "Female",
                              style: TextStyle(
                                  color: groupValue == "Female"
                                      ? Colors.red
                                      : Colors.grey),
                            ),
                            leading: Radio<String>(
                              value: "Female",
                              groupValue: groupValue,
                              fillColor: MaterialStateColor.resolveWith(
                                      (states) => groupValue == "Female"
                                      ? Colors.red
                                      : Colors.grey),
                              onChanged: (value) {
                                setState(() {
                                  groupValue = value as String;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 1,
                      color: Colors.grey,
                    ),
                    Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Date of birth",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              dateOfBirth == null
                                  ? "No date choisen!"
                                  : dateOfBirth.toString(),
                              style: TextStyle(
                                  color: dateOfBirth == null
                                      ? Colors.grey
                                      : Colors.deepOrange),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            OutlinedButton(
                                onPressed: _showDatePickerDialog,
                                style: OutlinedButton.styleFrom(
                                    side: BorderSide(color: Colors.deepOrange),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20))),
                                child: Text("Select date of birth"))
                          ],
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _getImage() async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        imagePatch = pickedImage.path;
      });
    }
  }

  void _showDatePickerDialog() async {
    DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime(2000),
        firstDate: DateTime(1971),
        lastDate: DateTime.now());

    if (selectedDate != null) {
      setState(() {
        dateOfBirth = DateFormat.yMMMEd().format(selectedDate);

      });
    }
  }

  void _saveContact() {
    final contact = ContactModel(
        name: nameController.text,
        mobile: mobileController.text,
        dateOfBirth: dateOfBirth,
        email: emailController.text,
        gender: groupValue,
        image: imagePatch,
        streetAddredd: streetAddressController.text,
        website: websiteController.text

    );
    contactListData.add(contact);
    Navigator.of(context).pop();
  }
}
