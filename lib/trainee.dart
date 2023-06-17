import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demoapp/Screens/fitnessScreen.dart';
import 'package:demoapp/Screens/todo_list.dart';
import 'package:demoapp/chat/chatbot.dart';
import 'package:demoapp/home.dart';
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
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users") //.where('uid', isEqualTo: user!.uid)
        .doc(id)
        .get()
        .then((value) {
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

  // @override
  // // final Stream<QuerySnapshot> _usersStream =
  // //     FirebaseFirestore.instance.collection('posts').snapshots();
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text(
  //         "Trainee",
  //       ),
  //       actions: [
  //         IconButton(
  //           onPressed: () {
  //             logout(context);
  //           },
  //           icon: Icon(Icons.logout),
  //         ),
  //       ],
  //     ),
  //     body: Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           ElevatedButton(
  //             child: Text("Nutritional Intake"),
  //             onPressed: () {
  //               Navigator.push(
  //                 context,
  //                 MaterialPageRoute(
  //                     builder: (context) => MenuScreen(
  //                           id: id,
  //                         )),
  //               );
  //             },
  //           ),
  //           ElevatedButton(
  //             child: Text("Calculate Body Mass Index"),
  //             onPressed: () {
  //               Navigator.push(
  //                 context,
  //                 MaterialPageRoute(builder: (context) => InputPage()),
  //               );
  //             },
  //           ),
  //           ElevatedButton(
  //             child: Text("Calorie Intake"),
  //             onPressed: () {
  //               Navigator.push(
  //                 context,
  //                 MaterialPageRoute(builder: (context) => DayViewScreen()),
  //               );
  //             },
  //           ),
  //           ElevatedButton(
  //             child: Text("Calorie chart"),
  //             onPressed: () {
  //               Navigator.push(
  //                 context,
  //                 MaterialPageRoute(builder: (context) => HistoryScreen()),
  //               );
  //             },
  //           ),
  //           ElevatedButton(
  //             child: Text("Chat Bot"),
  //             onPressed: () {
  //               Navigator.push(
  //                 context,
  //                 MaterialPageRoute(builder: (context) => chatbot()),
  //               );
  //             },
  //           ),
  //           ElevatedButton(
  //             child: Text("fitness tracker"),
  //             onPressed: () {
  //               Navigator.push(
  //                 context,
  //                 MaterialPageRoute(builder: (context) => fitscreen()),
  //               );
  //             },
  //           ),
  //           ElevatedButton(
  //             child: Text("fitness progress"),
  //             onPressed: () {
  //               Navigator.push(
  //                 context,
  //                 MaterialPageRoute(builder: (context) => TodoList()),
  //               );
  //             },
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Trainee",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              logout(context);
            },
            icon: Icon(Icons.logout),
          ),
        ],
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
                opacity: 0.8, // Adjust the opacity value (0.0 - 1.0)
                child: ElevatedButton.icon(
                  icon: Icon(Icons.restaurant_menu),
                  label: Text("Nutritional Intake"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MenuScreen(id: id),
                      ),
                    );
                  },
                ),
              ),
              Opacity(
                opacity: 0.8, // Adjust the opacity value (0.0 - 1.0)
                child: ElevatedButton.icon(
                  icon: Icon(Icons.calculate),
                  label: Text("Calculate BMI"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InputPage(),
                      ),
                    );
                  },
                ),
              ),
              Opacity(
                opacity: 0.8, // Adjust the opacity value (0.0 - 1.0)
                child: ElevatedButton.icon(
                  icon: Icon(Icons.calculate),
                  label: Text("BMI chart"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => bmiChart(),
                      ),
                    );
                  },
                ),
              ),
              // Add opacity wrapper to other buttons as well
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
                    );
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
                    );
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
                    );
                  },
                ),
              ),
              // Opacity(
              //   opacity: 0.8,
              //   child: ElevatedButton.icon(
              //     icon: Icon(Icons.fitness_center),
              //     label: Text("Fitness Tracker"),
              //     onPressed: () {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => fitscreen(),
              //         ),
              //       );
              //     },
              //   ),
              // ),
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
                    );
                  },
                ),
              ),
            ],
          ),
        ),
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
