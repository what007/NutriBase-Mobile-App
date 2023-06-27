// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:demoapp/home.dart';
// // import 'package:demoapp/view_post_details.dart';
// // import 'package:flutter/material.dart';

// // import 'package:firebase_auth/firebase_auth.dart';

// // import 'login.dart';
// // import 'view_nutri_post.dart';
// // import 'model.dart';

// // class MenuScreen extends StatefulWidget {
// //   String id;
// //   MenuScreen({required this.id});
// //   @override
// //   _MenuScreenState createState() => _MenuScreenState(id: id);
// // }

// // class _MenuScreenState extends State<MenuScreen> {
// //   String id;
// //   var rooll;
// //   var emaill;
// //   UserModel loggedInUser = UserModel();

// //   _MenuScreenState({required this.id});
// //   @override
// //   void initState() {
// //     super.initState();
// //     FirebaseFirestore.instance.collection("users").doc(id).get().then((value) {
// //       this.loggedInUser = UserModel.fromMap(value.data());
// //     }).whenComplete(() {
// //       CircularProgressIndicator();
// //       setState(() {
// //         emaill = loggedInUser.email.toString();
// //         rooll = loggedInUser.wrool.toString();
// //         id = loggedInUser.uid.toString();
// //       });
// //     });
// //   }

// //   @override
// //   final Stream<QuerySnapshot> _usersStream =
// //       FirebaseFirestore.instance.collection('posts').snapshots();

// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(
// //           "Nutritional Plan",
// //           style: TextStyle(color: Colors.white),
// //         ),
// //         backgroundColor: Colors.deepPurple,
// //         actions: [
// //           IconButton(
// //             onPressed: () {
// //               logout(context);
// //             },
// //             icon: Icon(Icons.logout),
// //             color: Colors.white,
// //           ),
// //         ],
// //       ),
// //       body: Container(
// //         decoration: BoxDecoration(
// //           gradient: LinearGradient(
// //             begin: Alignment.topCenter,
// //             end: Alignment.bottomCenter,
// //             colors: [Colors.purple, Colors.white],
// //           ),
// //         ),
// //         child: Padding(
// //           padding: EdgeInsets.only(top: 16.0),
// //           child: StreamBuilder(
// //             stream: _usersStream,
// //             builder:
// //                 (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
// //               if (snapshot.hasError) {
// //                 return Text("Something is wrong");
// //               }
// //               if (snapshot.connectionState == ConnectionState.waiting) {
// //                 return Center(
// //                   child: CircularProgressIndicator(),
// //                 );
// //               }

// //               return ListView.builder(
// //                 itemCount: snapshot.data!.docs.length,
// //                 itemBuilder: (_, index) {
// //                   DocumentSnapshot post = snapshot.data!.docs[index];
// //                   return GestureDetector(
// //                     onTap: () {
// //                       Navigator.push(
// //                         context,
// //                         MaterialPageRoute(
// //                           builder: (context) => ViewPostDetail(post: post),
// //                         ),
// //                       );
// //                     },
// //                     child: Card(
// //                       elevation: 3,
// //                       margin: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(10),
// //                       ),
// //                       child: ListTile(
// //                         title: Text(
// //                           snapshot.data!.docs[index].get('title'),
// //                           style: TextStyle(
// //                             fontSize: 20,
// //                           ),
// //                         ),
// //                         contentPadding: EdgeInsets.symmetric(
// //                           vertical: 12,
// //                           horizontal: 16,
// //                         ),
// //                       ),
// //                     ),
// //                   );
// //                 },
// //               );
// //             },
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Future<void> logout(BuildContext context) async {
// //     CircularProgressIndicator();
// //     await FirebaseAuth.instance.signOut();

// //     Navigator.of(context).pushReplacement(
// //       MaterialPageRoute(
// //         builder: (context) => LoginPage(),
// //       ),
// //     );
// //   }
// // }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:demoapp/Screens/todo_list.dart';
// import 'package:demoapp/chat/chatbot.dart';
// import 'package:demoapp/home.dart';
// import 'package:demoapp/profile.dart';
// import 'package:demoapp/src/page/day-view/day-view.dart';
// import 'package:demoapp/src/page/history/bmi_chart.dart';
// import 'package:demoapp/src/page/history/history_screen.dart';
// import 'package:demoapp/view_post_details.dart';
// import 'package:flutter/material.dart';

// import 'package:firebase_auth/firebase_auth.dart';

// import 'Screens/input_page.dart';
// import 'login.dart';
// import 'view_nutri_post.dart';
// import 'model.dart';

// class MenuScreen extends StatefulWidget {
//   String id;
//   MenuScreen({required this.id});
//   @override
//   _MenuScreenState createState() => _MenuScreenState(id: id);
// }

// class _MenuScreenState extends State<MenuScreen> {
//   String id;
//   var rooll;
//   var emaill;
//   UserModel loggedInUser = UserModel();

//   _MenuScreenState({required this.id});

//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   @override
//   void initState() {
//     super.initState();
//     FirebaseFirestore.instance.collection("users").doc(id).get().then((value) {
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

//   @override
//   final Stream<QuerySnapshot> _usersStream =
//       FirebaseFirestore.instance.collection('posts').snapshots();

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Nutritional Plan",
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.deepPurple,
//         actions: [
//           IconButton(
//             onPressed: () {
//               // Code for going to profile
//               goToProfile(
//                   context); // Call the function with the appropriate context
//             },
//             icon: Icon(Icons.person),
//           ),
//           IconButton(
//             onPressed: () {
//               logout(context);
//             },
//             icon: Icon(Icons.logout),
//             color: Colors.white,
//           ),
//         ],
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             UserAccountsDrawerHeader(
//               accountName: Text('Trainee Name'), //add the user's name here
//               accountEmail: Text('Trainee email'), //add the user's email here
//               currentAccountPicture: CircleAvatar(
//                 child: Icon(Icons.account_circle, size: 50),
//               ),
//               decoration: BoxDecoration(
//                 color: Colors.purple,
//               ),
//             ),
//             buildDrawerItem(
//               title: 'Calculate BMI',
//               icon: Icons.calculate,
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => InputPage(),
//                   ),
//                 ).then((value) {
//                   Future.delayed(Duration(milliseconds: 300), () {
//                     _scaffoldKey.currentState!.openEndDrawer();
//                   });
//                 });
//               },
//             ),
//             buildDrawerItem(
//               title: 'Calorie Intake',
//               icon: Icons.local_dining,
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => DayViewScreen(),
//                   ),
//                 ).then((value) {
//                   Future.delayed(Duration(milliseconds: 300), () {
//                     _scaffoldKey.currentState!.openEndDrawer();
//                   });
//                 });
//               },
//             ),
//             buildDrawerItemWithSubItems(
//               title: 'History Chart',
//               icon: Icons.history,
//               subItems: [
//                 buildDrawerSubItem(
//                   title: 'Calorie Chart',
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => HistoryScreen(),
//                       ),
//                     ).then((value) {
//                       Future.delayed(Duration(milliseconds: 300), () {
//                         _scaffoldKey.currentState!.openEndDrawer();
//                       });
//                     });
//                   },
//                 ),
//                 buildDrawerSubItem(
//                   title: 'BMI Chart',
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => bmiChart(),
//                       ),
//                     ).then((value) {
//                       Future.delayed(Duration(milliseconds: 300), () {
//                         _scaffoldKey.currentState!.openEndDrawer();
//                       });
//                     });
//                   },
//                 ),
//               ],
//             ),
//             buildDrawerItem(
//               title: 'Fitness Progress',
//               icon: Icons.timeline,
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => TodoList(),
//                   ),
//                 ).then((value) {
//                   Future.delayed(Duration(milliseconds: 300), () {
//                     _scaffoldKey.currentState!.openEndDrawer();
//                   });
//                 });
//               },
//             ),
//             buildDrawerItem(
//               title: 'Chat Bot',
//               icon: Icons.chat,
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => chatbot(),
//                   ),
//                 ).then((value) {
//                   Future.delayed(Duration(milliseconds: 300), () {
//                     _scaffoldKey.currentState!.openEndDrawer();
//                   });
//                 });
//               },
//             ),
//           ],
//         ),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [Colors.purple, Colors.white],
//           ),
//         ),
//         child: Padding(
//           padding: EdgeInsets.only(top: 16.0),
//           child: StreamBuilder(
//             stream: _usersStream,
//             builder:
//                 (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//               if (snapshot.hasError) {
//                 return Text("Something is wrong");
//               }
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }

//               return ListView.builder(
//                 itemCount: snapshot.data!.docs.length,
//                 itemBuilder: (_, index) {
//                   DocumentSnapshot post = snapshot.data!.docs[index];
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => ViewPostDetail(post: post),
//                         ),
//                       );
//                     },
//                     child: Card(
//                       elevation: 3,
//                       margin: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: ListTile(
//                         title: Text(
//                           snapshot.data!.docs[index].get('title'),
//                           style: TextStyle(
//                             fontSize: 20,
//                           ),
//                         ),
//                         contentPadding: EdgeInsets.symmetric(
//                           vertical: 12,
//                           horizontal: 16,
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildDrawerItem({
//     required String title,
//     required IconData icon,
//     required VoidCallback onTap,
//   }) {
//     return InkWell(
//       onTap: onTap,
//       splashColor: Colors.purple.withOpacity(0.3),
//       child: ListTile(
//         title: Text(title),
//         leading: Icon(icon),
//       ),
//     );
//   }

//   Widget buildDrawerItemWithSubItems({
//     required String title,
//     required IconData icon,
//     required List<Widget> subItems,
//   }) {
//     return ExpansionTile(
//       title: Text(title),
//       leading: Icon(icon),
//       children: subItems,
//     );
//   }

//   Widget buildDrawerSubItem({
//     required String title,
//     required VoidCallback onTap,
//   }) {
//     return InkWell(
//       onTap: onTap,
//       splashColor: Colors.purple.withOpacity(0.3),
//       child: ListTile(
//         title: Text(title),
//         leading: Icon(Icons.arrow_right),
//       ),
//     );
//   }

//   void goToProfile(BuildContext context) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => profile(),
//       ),
//     );
//   }

//   Future<void> logout(BuildContext context) async {
//     CircularProgressIndicator();
//     await FirebaseAuth.instance.signOut();

//     Navigator.of(context).pushReplacement(
//       MaterialPageRoute(
//         builder: (context) => LoginPage(),
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demoapp/Screens/todo_list.dart';
import 'package:demoapp/chat/chatbot.dart';
import 'package:demoapp/home.dart';
import 'package:demoapp/profile.dart';
import 'package:demoapp/src/page/day-view/day-view.dart';
import 'package:demoapp/src/page/history/bmi_chart.dart';
import 'package:demoapp/src/page/history/history_screen.dart';
import 'package:demoapp/view_post_details.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'Screens/input_page.dart';
import 'login.dart';
import 'view_nutri_post.dart';
import 'model.dart';

class MenuScreen extends StatefulWidget {
  String id;
  MenuScreen({required this.id});
  @override
  _MenuScreenState createState() => _MenuScreenState(id: id);
}

class _MenuScreenState extends State<MenuScreen> {
  String id;
  UserModel loggedInUser = UserModel();

  _MenuScreenState({required this.id});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Stream<DocumentSnapshot> getUserDataStream() {
    return FirebaseFirestore.instance.collection('users').doc(id).snapshots();
  }

  @override
  void initState() {
    super.initState();
    getUserDataStream().listen((snapshot) {
      if (snapshot.exists) {
        setState(() {
          loggedInUser = UserModel.fromMap(snapshot.data()!);
        });
      }
    });
  }

  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('posts').snapshots();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Nutritional Plan",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            onPressed: () {
              // Code for going to profile
              goToProfile(
                  context); // Call the function with the appropriate context
            },
            icon: Icon(Icons.person),
          ),
          IconButton(
            onPressed: () {
              logout(context);
            },
            icon: Icon(Icons.logout),
            color: Colors.white,
          ),
        ],
      ),
      drawer: Drawer(
        child: StreamBuilder<DocumentSnapshot>(
          stream: getUserDataStream(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Error');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            var user = snapshot.data!.data() as Map<String, dynamic>;
            var traineeName = user['name'];
            var traineeEmail = user['email'];

            return ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text(traineeName),
                  accountEmail: Text(traineeEmail),
                  // decoration: BoxDecoration(
                  //   color: Colors.purple,
                  //   // shape: BoxShape.circle,
                  //   // image: DecorationImage(
                  //   //   image: AssetImage('assets/profile.jpg'),
                  //   //   fit: BoxFit.fill,
                  //   // ),
                  //   border: Border.all(
                  //     color: Colors.deepPurpleAccent,
                  //     width: 4.0,
                  //   ),
                  //   boxShadow: [
                  //     BoxShadow(
                  //       color: Colors.grey.withOpacity(0.5),
                  //       spreadRadius: 2,
                  //       blurRadius: 7,
                  //       offset: Offset(0, 2),
                  //     ),
                  //   ],
                  // ),
                  currentAccountPicture: CircleAvatar(
                    child: Icon(Icons.account_circle, size: 70),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                  ),
                ),
                buildDrawerItem(
                  title: 'Calculate BMI',
                  icon: Icons.calculate,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InputPage(),
                      ),
                    ).then((value) {
                      Future.delayed(Duration(milliseconds: 300), () {
                        _scaffoldKey.currentState!.openEndDrawer();
                      });
                    });
                  },
                ),
                buildDrawerItem(
                  title: 'Calorie Intake',
                  icon: Icons.local_dining,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DayViewScreen(),
                      ),
                    ).then((value) {
                      Future.delayed(Duration(milliseconds: 300), () {
                        _scaffoldKey.currentState!.openEndDrawer();
                      });
                    });
                  },
                ),
                buildDrawerItemWithSubItems(
                  title: 'History Chart',
                  icon: Icons.history,
                  subItems: [
                    buildDrawerSubItem(
                      title: 'Calorie Chart',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HistoryScreen(),
                          ),
                        ).then((value) {
                          Future.delayed(Duration(milliseconds: 300), () {
                            _scaffoldKey.currentState!.openEndDrawer();
                          });
                        });
                      },
                    ),
                    buildDrawerSubItem(
                      title: 'BMI Chart',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => bmiChart(),
                          ),
                        ).then((value) {
                          Future.delayed(Duration(milliseconds: 300), () {
                            _scaffoldKey.currentState!.openEndDrawer();
                          });
                        });
                      },
                    ),
                  ],
                ),
                buildDrawerItem(
                  title: 'Fitness Progress',
                  icon: Icons.timeline,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TodoList(),
                      ),
                    ).then((value) {
                      Future.delayed(Duration(milliseconds: 300), () {
                        _scaffoldKey.currentState!.openEndDrawer();
                      });
                    });
                  },
                ),
                buildDrawerItem(
                  title: 'Chat Bot',
                  icon: Icons.chat,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => chatbot(),
                      ),
                    ).then((value) {
                      Future.delayed(Duration(milliseconds: 300), () {
                        _scaffoldKey.currentState!.openEndDrawer();
                      });
                    });
                  },
                ),
              ],
            );
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple, Colors.white],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 16.0),
          child: StreamBuilder(
            stream: _usersStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text("Something is wrong");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (_, index) {
                  DocumentSnapshot post = snapshot.data!.docs[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ViewPostDetail(post: post),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 3,
                      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        title: Text(
                          snapshot.data!.docs[index].get('title'),
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 16,
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildDrawerItem({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.purple.withOpacity(0.3),
      child: ListTile(
        title: Text(title),
        leading: Icon(icon),
      ),
    );
  }

  Widget buildDrawerItemWithSubItems({
    required String title,
    required IconData icon,
    required List<Widget> subItems,
  }) {
    return ExpansionTile(
      title: Text(title),
      leading: Icon(icon),
      children: subItems,
    );
  }

  Widget buildDrawerSubItem({
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.purple.withOpacity(0.3),
      child: ListTile(
        title: Text(title),
        leading: Icon(Icons.arrow_right),
      ),
    );
  }

  void goToProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => profile(),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }
}
