import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demoapp/chat/chatPageCoach.dart';
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

  void navigateToChatPage(String coachId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => chatPageCoach(traineeId: coachId),
      ),
    );
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
                      onTap: () {
                        navigateToChatPage(doc.id);
                      },
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
                              // child: ListTile(
                              //   title: Text(
                              //     name,
                              //     style: TextStyle(fontSize: 20),
                              //   ),
                              //   subtitle: Text(
                              //     email,
                              //     style: TextStyle(fontSize: 16),
                              //   ),
                              //   contentPadding: EdgeInsets.symmetric(
                              //     vertical: 12,
                              //     horizontal: 16,
                              //   ),
                              // ),
                              child: ListTile(
                                leading: Icon(
                                  Icons.person,
                                  size: 40,
                                ),
                                title: Text(
                                  name,
                                  style: TextStyle(fontSize: 20),
                                ),
                                // subtitle: Text(
                                //   email,
                                //   style: TextStyle(fontSize: 16),
                                // ),
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

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
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
//             end: Colors.purple.shade600,
//           ),
//         ),
//         TweenSequenceItem(
//           weight: 1.0,
//           tween: ColorTween(
//             begin: Colors.purple.shade600,
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

//   void navigateToChatPage(String traineeId) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => TraineeChatPage(traineeId: traineeId),
//       ),
//     );
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
//                       onTap: () {
//                         navigateToChatPage(doc.id);
//                       },
//                       child: Column(
//                         children: [
//                           SizedBox(height: 4),
//                           Padding(
//                             padding: EdgeInsets.only(left: 3, right: 3),
//                             child: Card(
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                                 side: BorderSide(color: Colors.black),
//                               ),
//                               child: ListTile(
//                                 title: Text(
//                                   name,
//                                   style: TextStyle(fontSize: 20),
//                                 ),
//                                 subtitle: Text(
//                                   email,
//                                   style: TextStyle(fontSize: 16),
//                                 ),
//                                 contentPadding: EdgeInsets.symmetric(
//                                   vertical: 12,
//                                   horizontal: 16,
//                                 ),
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

// class TraineeChatPage extends StatefulWidget {
//   final String traineeId;

//   TraineeChatPage({required this.traineeId});

//   @override
//   _TraineeChatPageState createState() => _TraineeChatPageState();
// }

// class _TraineeChatPageState extends State<TraineeChatPage> {
//   List<String> messages = [];

//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final TextEditingController _messageController = TextEditingController();

//   void _sendMessage(String chatId) async {
//     final text = _messageController.text.trim();
//     _messageController.clear();

//     if (text.isNotEmpty) {
//       await _firestore
//           .collection('chats')
//           .doc(chatId)
//           .collection('messages')
//           .add({
//         'senderUid': FirebaseAuth.instance.currentUser!.uid,
//         'recipientUid': widget.traineeId,
//         'text': text,
//         'timestamp': FieldValue.serverTimestamp(),
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chat with Trainee ${widget.traineeId}'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: messages.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(messages[index]),
//                 );
//               },
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 10),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     decoration: InputDecoration(
//                       hintText: 'Type your message...',
//                     ),
//                     onSubmitted: (value) {
//                       _sendMessage(value);
//                     },
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.send),
//                   onPressed: () {
//                     _sendMessage(
//                         'Hardoded message'); // Change or remove this line as needed
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
