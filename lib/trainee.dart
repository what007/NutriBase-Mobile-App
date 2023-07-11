// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:demoapp/Screens/fitnessScreen.dart';
// import 'package:demoapp/Screens/todo_list.dart';
// import 'package:demoapp/chat/chatbot.dart';
// import 'package:demoapp/home.dart';
// import 'package:demoapp/profile.dart';
// import 'package:demoapp/src/page/day-view/day-view.dart';
// import 'package:demoapp/src/page/history/bmi_chart.dart';
// import 'package:demoapp/src/page/history/history_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
// import 'Screens/input_page.dart';
// import 'package:demoapp/routes/router.dart';

// import 'login.dart';
// import 'view_nutri_post.dart';
// import 'model.dart';

// class Student extends StatefulWidget {
//   String id;
//   Student({required this.id});
//   @override
//   _StudentState createState() => _StudentState(id: id);
// }

// class _StudentState extends State<Student> {
//   String id;
//   var rooll;
//   var emaill;
//   UserModel loggedInUser = UserModel();

//   _StudentState({required this.id});
//   @override
//   void initState() {
//     super.initState();
//     FirebaseFirestore.instance
//         .collection("users") //.where('uid', isEqualTo: user!.uid)
//         .doc(id)
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

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Trainee",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         backgroundColor: Colors.purple,
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
//           ),
//         ],
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage("assets/background_image.jpeg"),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Center(
//           child: GridView.count(
//             crossAxisCount: 2,
//             padding: EdgeInsets.all(16.0),
//             mainAxisSpacing: 16.0,
//             crossAxisSpacing: 16.0,
//             children: [
//               Opacity(
//                 opacity: 0.8, // Adjust the opacity value (0.0 - 1.0)
//                 child: ElevatedButton.icon(
//                   icon: Icon(Icons.restaurant_menu),
//                   label: Text("Nutritional Intake"),
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => MenuScreen(id: id),
//                       ),
//                       //  MaterialPageRoute(
//                       //   builder: (context) => ViewPosts(userId: id),
//                       // ),
//                     );
//                   },
//                 ),
//               ),
//               Opacity(
//                 opacity: 0.8, // Adjust the opacity value (0.0 - 1.0)
//                 child: ElevatedButton.icon(
//                   icon: Icon(Icons.calculate),
//                   label: Text("Calculate BMI"),
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => InputPage(),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               Opacity(
//                 opacity: 0.8, // Adjust the opacity value (0.0 - 1.0)
//                 child: ElevatedButton.icon(
//                   icon: Icon(Icons.calculate),
//                   label: Text("BMI chart"),
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => bmiChart(),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               // Add opacity wrapper to other buttons as well
//               Opacity(
//                 opacity: 0.8,
//                 child: ElevatedButton.icon(
//                   icon: Icon(Icons.local_dining),
//                   label: Text("Calorie Intake"),
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => DayViewScreen(),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               Opacity(
//                 opacity: 0.8,
//                 child: ElevatedButton.icon(
//                   icon: Icon(Icons.bar_chart),
//                   label: Text("Calorie Chart"),
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => HistoryScreen(),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               Opacity(
//                 opacity: 0.8,
//                 child: ElevatedButton.icon(
//                   icon: Icon(Icons.chat),
//                   label: Text("Chat Bot"),
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => chatbot(),
//                       ),
//                     );
//                   },
//                 ),
//               ),

//               Opacity(
//                 opacity: 0.8,
//                 child: ElevatedButton.icon(
//                   icon: Icon(Icons.timeline),
//                   label: Text("Fitness Progress"),
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => TodoList(),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
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
import 'package:demoapp/Screens/fitnessScreen.dart';
import 'package:demoapp/Screens/todo_list.dart';
import 'package:demoapp/chat/chatbot.dart';
import 'package:demoapp/home.dart';
import 'package:demoapp/profile.dart';
import 'package:demoapp/src/page/day-view/day-view.dart';
import 'package:demoapp/src/page/history/bmi_chart.dart';
import 'package:demoapp/src/page/history/history_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'Screens/input_page.dart';
import 'package:demoapp/routes/router.dart';

import 'login.dart';
import 'view_nutri_post.dart';
import 'model.dart';

class Student extends StatefulWidget {
  String id;
  Student({required this.id});
  @override
  _StudentState createState() => _StudentState(id: id);
}

class _StudentState extends State<Student> {
  String id;
  var rooll;
  var emaill;
  UserModel loggedInUser = UserModel();

  _StudentState({required this.id});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance.collection("users").doc(id).get().then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
    }).whenComplete(() {
      CircularProgressIndicator();
      setState(() {
        emaill = loggedInUser.email.toString();
        rooll = loggedInUser.wrool.toString();
        id = loggedInUser.uid.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          "Trainee",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.purple,
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
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            buildDrawerItem(
              title: 'Nutritional Intake',
              icon: Icons.restaurant_menu,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MenuScreen(id: id),
                  ),
                ).then((value) {
                  Future.delayed(Duration(milliseconds: 300), () {
                    _scaffoldKey.currentState!.openEndDrawer();
                  });
                });
              },
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
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background_image.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.all(16.0),
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 16.0,
            children: [
              Opacity(
                opacity: 0.8,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.restaurant_menu),
                  label: Text("Nutritional Intake"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MenuScreen(id: id),
                      ),
                    ).then((value) {
                      Future.delayed(Duration(milliseconds: 300), () {
                        _scaffoldKey.currentState!.openEndDrawer();
                      });
                    });
                  },
                ),
              ),
              Opacity(
                opacity: 0.8,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.calculate),
                  label: Text("Calculate BMI"),
                  onPressed: () {
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
              ),
              Opacity(
                opacity: 0.8,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.calculate),
                  label: Text("BMI chart"),
                  onPressed: () {
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
              ),
              Opacity(
                opacity: 0.8,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.local_dining),
                  label: Text("Calorie Intake"),
                  onPressed: () {
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
              ),
              Opacity(
                opacity: 0.8,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.bar_chart),
                  label: Text("Calorie Chart"),
                  onPressed: () {
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
              ),
              Opacity(
                opacity: 0.8,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.chat),
                  label: Text("Chat Bot"),
                  onPressed: () {
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
              ),
              Opacity(
                opacity: 0.8,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.timeline),
                  label: Text("Fitness Progress"),
                  onPressed: () {
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
              ),
              Opacity(
                opacity: 0.8,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.timeline),
                  label: Text("About Us"),
                  onPressed: () {
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
              ),
            ],
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
