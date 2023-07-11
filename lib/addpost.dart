import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddPost extends StatelessWidget {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('posts');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Post'),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            onPressed: () {
              ref.add({
                'title': title.text,
                'description': description.text,
              }).whenComplete(() {
                Navigator.pop(context);
              });
            },
            icon: Icon(Icons.save),
            color: Colors.white,
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.deepPurple.shade100, Colors.white],
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Title",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: TextField(
                  controller: title,
                  decoration: InputDecoration(
                    hintText: 'Enter title here',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Description",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: TextField(
                  controller: description,
                  decoration: InputDecoration(
                    hintText: 'Enter description here',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  maxLines: null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class AddPost extends StatefulWidget {
//   @override
//   _AddPostState createState() => _AddPostState();
// }

// class _AddPostState extends State<AddPost> {
//   TextEditingController title = TextEditingController();
//   TextEditingController description = TextEditingController();

//   CollectionReference ref = FirebaseFirestore.instance.collection('posts');
//   String errorMessage = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add New Post'),
//         backgroundColor: Colors.deepPurple,
//         actions: [
//           IconButton(
//             onPressed: () {
//               setState(() {
//                 if (title.text.isEmpty && description.text.isEmpty) {
//                   errorMessage = 'Please fill in the title and description.';
//                 } else if (title.text.isEmpty) {
//                   errorMessage = 'Please fill in the title.';
//                 } else if (!isAlphanumeric(title.text)) {
//                   errorMessage = 'Title should be alphanumeric.';
//                 } else if (description.text.isEmpty) {
//                   errorMessage = 'Please fill in the description.';
//                 } else if (!isAlphanumeric(description.text)) {
//                   errorMessage = 'Description should be alphanumeric.';
//                 } else {
//                   ref.add({
//                     'title': title.text,
//                     'description': description.text,
//                   }).whenComplete(() {
//                     Navigator.pop(context);
//                   });
//                 }
//               });
//             },
//             icon: Icon(Icons.save),
//             color: Colors.white,
//           ),
//         ],
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [Colors.deepPurple.shade100, Colors.white],
//           ),
//         ),
//         child: SingleChildScrollView(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Title",
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.deepPurple,
//                 ),
//               ),
//               SizedBox(height: 10),
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.3),
//                       spreadRadius: 2,
//                       blurRadius: 5,
//                     ),
//                   ],
//                 ),
//                 child: TextField(
//                   controller: title,
//                   decoration: InputDecoration(
//                     hintText: 'Enter title here',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 16),
//               Text(
//                 "Description",
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.deepPurple,
//                 ),
//               ),
//               SizedBox(height: 10),
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.3),
//                       spreadRadius: 2,
//                       blurRadius: 5,
//                     ),
//                   ],
//                 ),
//                 child: TextField(
//                   controller: description,
//                   decoration: InputDecoration(
//                     hintText: 'Enter description here',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                   maxLines: null,
//                 ),
//               ),
//               SizedBox(height: 10),
//               errorMessage.isNotEmpty
//                   ? Text(
//                       errorMessage,
//                       style: TextStyle(
//                         color: Colors.red,
//                       ),
//                     )
//                   : SizedBox(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   bool isAlphanumeric(String input) {
//     final alphanumericRegex = RegExp(r'^[a-zA-Z0-9]+$');
//     return alphanumericRegex.hasMatch(input);
//   }
// }
