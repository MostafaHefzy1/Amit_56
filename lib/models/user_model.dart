class UserModel {
  String? docId;
  String? name;
  String? email;
  String? phone;

  UserModel({this.docId, this.email, this.name, this.phone});

  UserModel.formJson(Map<String, dynamic> json) {
    name = json["name"];
    docId = json["docId"];
    email = json["email"];
    phone = json["phone"];
  }
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "docId": docId,
      "email": email,
      "phone": phone,
    };
  }
}
