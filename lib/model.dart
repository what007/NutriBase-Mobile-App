// class UserModel {
//   String? email;
//   String? wrool;
//   String? uid;

// // receiving data
//   UserModel({this.uid, this.email, this.wrool});
//   factory UserModel.fromMap(map) {
//     return UserModel(
//       uid: map['uid'],
//       email: map['email'],
//       wrool: map['wrool'],
//     );
//   }
// // sending data
//   Map<String, dynamic> toMap() {
//     return {
//       'uid': uid,
//       'email': email,
//       'wrool': wrool,
//     };
//   }
// }

class UserModel {
  String? name; // Add the name field
  String? email;
  String? wrool;
  String? uid;

  UserModel(
      {this.uid,
      this.name,
      this.email,
      this.wrool}); // Update the constructor to include name
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      name: map['name'], // Assign the value from the map to the name field
      email: map['email'],
      wrool: map['wrool'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name, // Add the name field to the map
      'email': email,
      'wrool': wrool,
    };
  }
}
