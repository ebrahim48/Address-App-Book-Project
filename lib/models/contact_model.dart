class ContactModel {
  int? id;
  String name;
  String mobile;
  String? email;
  String? streetAddredd;
  String? dateOfBirth;
  String? image;
  String? gender;
  String? website;
  bool favorite;

  ContactModel(
      {this.id,
        required this.name,
        required this.mobile,
        this.email,
        this.streetAddredd,
        this.dateOfBirth,
        this.image,
        this.gender,
        this.website,
      this.favorite = false,});
}

List<ContactModel> contactListData = [
  ContactModel(
      name: "Rokeya",
      mobile: "01701406710",
      id: 1,
      dateOfBirth: "01/10/2001",
      email: "rokeya@gmail.com",
      gender: "Female",
      streetAddredd: "Mirpur10, Dhaka",
      website: "www.google.com"),
  ContactModel(
      name: "Kabila",
      mobile: "01745372849",
      id: 1,
      dateOfBirth: "21/30/2001",
      email: "kabila@gmail.com",
      gender: "Male",
      streetAddredd: "Mirpur10, Dhaka",
      website: "devrasel.com"),
];
