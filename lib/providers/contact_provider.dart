import 'package:addressbook_app/models/contact_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ContactProvider extends ChangeNotifier{
  List<ContactModel> contactList = [];

  addContact(ContactModel contactModel) {
    contactList.add(contactModel);
    notifyListeners();
  }

  getAllContacts() {
    this.contactList = contactList;
    notifyListeners();
  }

  updateFavorite(int index) {
    contactList[index].favorite = !contactList[index].favorite;
    notifyListeners();
  }
  DeleteContact(ContactModel contactModel) {
    contactList.remove(contactModel);
    notifyListeners();
  }
}