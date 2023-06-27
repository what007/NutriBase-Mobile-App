// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/material.dart';

// // class studentList extends StatefulWidget {
// //   @override
// //   _studentListState createState() => _studentListState();
// // }

// // class _studentListState extends State<studentList> {
// //   final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
// //       .collection('users')
// //       .where('wrool', isEqualTo: 'Trainee')
// //       .snapshots();
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Summer Gym Members'),
// //         backgroundColor: Colors.purple,
// //       ),
// //       body: StreamBuilder(
// //         stream: _usersStream,
// //         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
// //           if (snapshot.hasError) {
// //             return Text("something is wrong");
// //           }
// //           if (snapshot.connectionState == ConnectionState.waiting) {
// //             return Center(
// //               child: CircularProgressIndicator(),
// //             );
// //           }

// //           return Container(
// //             decoration: BoxDecoration(
// //               borderRadius: BorderRadius.circular(12),
// //             ),
// //             child: ListView.builder(
// //               itemCount: snapshot.data!.docs.length,
// //               itemBuilder: (_, index) {
// //                 return GestureDetector(
// //                   onTap: () {},
// //                   child: Column(
// //                     children: [
// //                       SizedBox(
// //                         height: 4,
// //                       ),
// //                       Padding(
// //                         padding: EdgeInsets.only(
// //                           left: 3,
// //                           right: 3,
// //                         ),
// //                         child: ListTile(
// //                           shape: RoundedRectangleBorder(
// //                             borderRadius: BorderRadius.circular(10),
// //                             side: BorderSide(
// //                               color: Colors.black,
// //                             ),
// //                           ),
// //                           title: Text(
// //                             snapshot.data!.docChanges[index].doc['email'],
// //                             style: TextStyle(
// //                               fontSize: 20,
// //                             ),
// //                           ),
// //                           contentPadding: EdgeInsets.symmetric(
// //                             vertical: 12,
// //                             horizontal: 16,
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 );
// //               },
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class studentList extends StatefulWidget {
//   @override
//   _studentListState createState() => _studentListState();
// }

// class _studentListState extends State<studentList>
//     with SingleTickerProviderStateMixin {
//   final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
//       .collection('users')
//       .where('wrool', isEqualTo: 'Trainee')
//       .snapshots();

//   late AnimationController _animationController;
//   late Animation<Color?> _backgroundColorAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       duration: Duration(seconds: 2),
//       vsync: this,
//     )..repeat(reverse: true);
//     _backgroundColorAnimation = TweenSequence<Color?>(
//       [
//         TweenSequenceItem(
//           weight: 1.0,
//           tween: ColorTween(
//             begin: Colors.purple.shade800,
//             end: Colors.purple.shade400,
//           ),
//         ),
//         TweenSequenceItem(
//           weight: 1.0,
//           tween: ColorTween(
//             begin: Colors.purple.shade400,
//             end: Colors.purple.shade800,
//           ),
//         ),
//       ],
//     ).animate(_animationController);
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Summer Gym Members'),
//         backgroundColor: Colors.purple,
//       ),
//       body: AnimatedBuilder(
//         animation: _animationController,
//         builder: (BuildContext context, Widget? child) {
//           return Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12),
//               color: _backgroundColorAnimation.value,
//             ),
//             child: StreamBuilder(
//               stream: _usersStream,
//               builder: (BuildContext context,
//                   AsyncSnapshot<QuerySnapshot> snapshot) {
//                 if (snapshot.hasError) {
//                   return Text("Something went wrong");
//                 }
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }

//                 return ListView.builder(
//                   itemCount: snapshot.data!.docs.length,
//                   itemBuilder: (_, index) {
//                     final doc = snapshot.data!.docs[index];
//                     final name = doc['name'];
//                     final email = doc['email'];

//                     return GestureDetector(
//                       onTap: () {},
//                       child: Column(
//                         children: [
//                           SizedBox(height: 4),
//                           Padding(
//                             padding: EdgeInsets.only(left: 3, right: 3),
//                             child: ListTile(
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                                 side: BorderSide(color: Colors.black),
//                               ),
//                               title: Text(
//                                 name,
//                                 style: TextStyle(fontSize: 20),
//                               ),
//                               subtitle: Text(
//                                 email,
//                                 style: TextStyle(fontSize: 16),
//                               ),
//                               contentPadding: EdgeInsets.symmetric(
//                                 vertical: 12,
//                                 horizontal: 16,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class studentList extends StatefulWidget {
  @override
  _studentListState createState() => _studentListState();
}

class _studentListState extends State<studentList>
    with SingleTickerProviderStateMixin {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('users')
      .where('wrool', isEqualTo: 'Trainee')
      .snapshots();

  late AnimationController _animationController;
  late Animation<Color?> _backgroundColorAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _backgroundColorAnimation = TweenSequence<Color?>(
      [
        TweenSequenceItem(
          weight: 1.0,
          tween: ColorTween(
            begin: Colors.purple.shade800,
            end: Colors.purple.shade600,
          ),
        ),
        TweenSequenceItem(
          weight: 1.0,
          tween: ColorTween(
            begin: Colors.purple.shade600,
            end: Colors.purple.shade800,
          ),
        ),
      ],
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Summer Gym Members'),
        backgroundColor: Colors.purple,
      ),
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget? child) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: _backgroundColorAnimation.value,
            ),
            child: StreamBuilder(
              stream: _usersStream,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text("Something went wrong");
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (_, index) {
                    final doc = snapshot.data!.docs[index];
                    final name = doc['name'];
                    final email = doc['email'];

                    return GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          SizedBox(height: 4),
                          Padding(
                            padding: EdgeInsets.only(left: 3, right: 3),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(color: Colors.black),
                              ),
                              child: ListTile(
                                title: Text(
                                  name,
                                  style: TextStyle(fontSize: 20),
                                ),
                                subtitle: Text(
                                  email,
                                  style: TextStyle(fontSize: 16),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
