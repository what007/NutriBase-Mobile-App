// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:demoapp/view_nutri_post.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// import 'model.dart';
// import 'trainee.dart';
// import 'coach.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   _HomePageState();
//   @override
//   Widget build(BuildContext context) {
//     return contro();
//   }
// }

// class contro extends StatefulWidget {
//   contro();

//   @override
//   _controState createState() => _controState();
// }

// class _controState extends State<contro> {
//   _controState();
//   User? user = FirebaseAuth.instance.currentUser;
//   UserModel loggedInUser = UserModel();
//   String? rooll;
//   String? emaill;
//   String id = '';
//   @override
//   void initState() {
//     super.initState();
//     FirebaseFirestore.instance
//         .collection("users") //.where('uid', isEqualTo: user!.uid)
//         .doc(user!.uid)
//         .get()
//         .then((value) {
//       this.loggedInUser = UserModel.fromMap(value.data());
//     }).whenComplete(() {
//       CircularProgressIndicator();
//       setState(() {
//         emaill = loggedInUser.email.toString();
//         rooll = loggedInUser.wrool.toString();
//         id = loggedInUser.uid.toString();
//       });
//     });
//   }

//   routing() {
//     if (rooll == 'Trainee') {
//       // return Student(
//       return MenuScreen(
//         id: id,
//       );
//     } else {
//       return Teacher(
//         id: id,
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     CircularProgressIndicator();
//     return routing();
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demoapp/view_nutri_post.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'model.dart';
import 'trainee.dart';
import 'coach.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _HomePageState();
  @override
  Widget build(BuildContext context) {
    return Contro();
  }
}

class Contro extends StatefulWidget {
  Contro();

  @override
  _ControState createState() => _ControState();
}

class _ControState extends State<Contro> {
  _ControState();
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  String? rooll;
  String? emaill;
  String id = '';
  bool loading = true; // add a loading state variable

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
    }).whenComplete(() {
      setState(() {
        emaill = loggedInUser.email.toString();
        rooll = loggedInUser.wrool.toString();
        id = loggedInUser.uid.toString();
        loading = false; // set loading to false after state has been set
      });
    });
  }

  routing() {
    if (rooll == 'Trainee') {
      return MenuScreen(
        id: id,
      );
    } else {
      return Teacher(
        id: id,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      // check if it's loading
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return routing();
    }
  }
}
