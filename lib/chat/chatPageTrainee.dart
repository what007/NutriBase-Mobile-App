// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class chatPageTrainee extends StatefulWidget {
//   final String coachId;

//   chatPageTrainee({required this.coachId});

//   @override
//   _ChatPageTraineeState createState() => _ChatPageTraineeState();
// }

// class _ChatPageTraineeState extends State<chatPageTrainee> {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final TextEditingController _messageController = TextEditingController();
//   late Future<DocumentSnapshot> _coachData;

//   @override
//   void initState() {
//     super.initState();
//     _coachData = _firestore.collection('users').doc(widget.coachId).get();
//   }

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
//         'recipientUid': widget.coachId,
//         'text': text,
//         'timestamp': FieldValue.serverTimestamp(),
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final currentUserId = FirebaseAuth.instance.currentUser!.uid;
//     final chatId = currentUserId.hashCode <= widget.coachId.hashCode
//         ? currentUserId + widget.coachId
//         : widget.coachId + currentUserId;

//     return FutureBuilder<DocumentSnapshot>(
//         future: _coachData,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Scaffold(
//               body: Center(child: CircularProgressIndicator()),
//             );
//           }
//           final coachName = snapshot.data!.get('name');

//           return Scaffold(
//             appBar: AppBar(
//               title: Text('$coachName'),
//             ),
//             body: Column(
//               children: [
//                 Expanded(
//                   child: StreamBuilder<QuerySnapshot>(
//                     stream: _firestore
//                         .collection('chats')
//                         .doc(chatId)
//                         .collection('messages')
//                         .orderBy('timestamp', descending: true)
//                         .snapshots(),
//                     builder: (context, snapshot) {
//                       if (!snapshot.hasData) {
//                         return const Center(child: CircularProgressIndicator());
//                       }
//                       final messages = snapshot.data!.docs;
//                       return ListView.builder(
//                         reverse: true,
//                         itemCount: messages.length,
//                         itemBuilder: (context, index) {
//                           final message =
//                               messages[index].data() as Map<String, dynamic>;
//                           final text = message['text'];
//                           final timestamp = message['timestamp']
//                               .toDate(); // convert timestamp to DateTime
//                           final formattedDate = DateFormat.yMMMd()
//                               .add_jm()
//                               .format(timestamp); // format the DateTime

//                           bool isMyMessage =
//                               currentUserId == message['senderUid'];

//                           return Column(
//                             crossAxisAlignment: isMyMessage
//                                 ? CrossAxisAlignment.end
//                                 : CrossAxisAlignment.start,
//                             children: [
//                               Container(
//                                 padding: const EdgeInsets.all(10.0),
//                                 margin: const EdgeInsets.only(
//                                     bottom: 10.0, left: 20.0, right: 20.0),
//                                 decoration: BoxDecoration(
//                                   color: isMyMessage
//                                       ? Colors.blue[200]
//                                       : Colors.grey[200],
//                                   borderRadius: BorderRadius.circular(10.0),
//                                 ),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(text),
//                                     Text(
//                                       formattedDate,
//                                       style: const TextStyle(
//                                         fontSize: 10.0,
//                                         color: Colors.black87,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           );
//                         },
//                       );
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: TextField(
//                           controller: _messageController,
//                           decoration: const InputDecoration(
//                             hintText: 'Enter a message...',
//                           ),
//                         ),
//                       ),
//                       ElevatedButton(
//                         onPressed: () {
//                           _sendMessage(chatId);
//                         },
//                         child: const Text('Send'),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         });
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class chatPageTrainee extends StatefulWidget {
  final String coachId;

  chatPageTrainee({required this.coachId});

  @override
  _ChatPageTraineeState createState() => _ChatPageTraineeState();
}

class _ChatPageTraineeState extends State<chatPageTrainee> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _messageController = TextEditingController();
  late Future<DocumentSnapshot> _coachData;

  @override
  void initState() {
    super.initState();
    _coachData = _firestore.collection('users').doc(widget.coachId).get();
  }

  void _sendMessage(String chatId) async {
    final text = _messageController.text.trim();
    _messageController.clear();

    if (text.isNotEmpty) {
      await _firestore
          .collection('chats')
          .doc(chatId)
          .collection('messages')
          .add({
        'senderUid': FirebaseAuth.instance.currentUser!.uid,
        'recipientUid': widget.coachId,
        'text': text,
        'timestamp': FieldValue.serverTimestamp(),
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentUserId = FirebaseAuth.instance.currentUser!.uid;
    final chatId = currentUserId.hashCode <= widget.coachId.hashCode
        ? currentUserId + widget.coachId
        : widget.coachId + currentUserId;

    return FutureBuilder<DocumentSnapshot>(
        future: _coachData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          final coachName = snapshot.data!.get('name');

          return Scaffold(
            appBar: AppBar(
              title: Text('$coachName'),
              backgroundColor: Colors.purple, // Changed AppBar color to purple
            ),
            body: Container(
              // Added gradient colors
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xffc1a1d3), Color(0xff9c4dcc)],
              )),
              child: Padding(
                padding: EdgeInsets.all(10.0), // Added some padding
                child: Column(
                  children: [
                    Expanded(
                      child: StreamBuilder<QuerySnapshot>(
                        stream: _firestore
                            .collection('chats')
                            .doc(chatId)
                            .collection('messages')
                            .orderBy('timestamp', descending: true)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }

                          final messages = snapshot.data!.docs;

                          return ListView.builder(
                            reverse: true,
                            itemCount: messages.length,
                            itemBuilder: (context, index) {
                              final message = messages[index].data()
                                  as Map<String, dynamic>;
                              final text = message['text'];
                              final timestamp = message['timestamp']
                                  .toDate(); // convert timestamp to DateTime
                              final formattedDate = DateFormat.yMMMd()
                                  .add_jm()
                                  .format(timestamp); // format the DateTime

                              bool isMyMessage =
                                  currentUserId == message['senderUid'];

                              return Column(
                                crossAxisAlignment: isMyMessage
                                    ? CrossAxisAlignment.end
                                    : CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10.0),
                                    margin: const EdgeInsets.only(
                                        bottom: 10.0, left: 20.0, right: 20.0),
                                    decoration: BoxDecoration(
                                      color: isMyMessage
                                          ? Colors.blue[200]
                                          : Colors.grey[200],
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(text),
                                        Text(
                                          formattedDate,
                                          style: const TextStyle(
                                            fontSize: 10.0,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Row(
                    //     children: [
                    //       Expanded(
                    //         child: TextField(
                    //           controller: _messageController,
                    //           decoration: const InputDecoration(
                    //             hintText: 'Enter a message...',
                    //           ),
                    //         ),
                    //       ),
                    //       ElevatedButton(
                    //         onPressed: () {
                    //           _sendMessage(chatId);
                    //         },
                    //         child: const Text('Send'),
                    //       ),
                    //     ],
                    //   ),
                    // ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        //color: Colors.deepPurple,
                        padding:
                            EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _messageController,
                                style: TextStyle(
                                    color: Color.fromARGB(250, 162, 197, 238)),
                                decoration: InputDecoration(
                                  hintText: 'Type a message...',
                                  hintStyle: TextStyle(
                                      color:
                                          Color.fromARGB(250, 162, 197, 238)),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                _sendMessage(chatId);
                              },
                              icon: Icon(
                                Icons.send,
                                color: Color.fromARGB(250, 162, 197, 238),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
