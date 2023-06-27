// import 'package:dialog_flowtter/dialog_flowtter.dart';
// import 'package:flutter/material.dart';
// import '../chat/Messages.dart';

// class chatbot extends StatefulWidget {
//   const chatbot({Key? key}) : super(key: key);

//   @override
//   _chatbotState createState() => _chatbotState();
// }

// class _chatbotState extends State<chatbot> {
//   late DialogFlowtter dialogFlowtter;
//   final TextEditingController _controller = TextEditingController();

//   List<Map<String, dynamic>> messages = [];

//   @override
//   void initState() {
//     DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('NutriBot'),
//         backgroundColor: Colors.purple,
//       ),
//       body: Container(
//         child: Column(
//           children: [
//             Expanded(child: MessagesScreen(messages: messages)),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
//               color: Colors.deepPurple,
//               child: Row(
//                 children: [
//                   Expanded(
//                       child: TextField(
//                     controller: _controller,
//                     style: TextStyle(color: Colors.white),
//                   )),
//                   IconButton(
//                       onPressed: () {
//                         sendMessage(_controller.text);
//                         _controller.clear();
//                       },
//                       icon: Icon(Icons.send))
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   sendMessage(String text) async {
//     if (text.isEmpty) {
//       print('Message is empty');
//     } else {
//       setState(() {
//         addMessage(Message(text: DialogText(text: [text])), true);
//       });

//       DetectIntentResponse response = await dialogFlowtter.detectIntent(
//           queryInput: QueryInput(text: TextInput(text: text)));
//       if (response.message == null) return;
//       setState(() {
//         addMessage(response.message!);
//       });
//     }
//   }

//   addMessage(Message message, [bool isUserMessage = false]) {
//     messages.add({
//       'message': message,
//       'isUserMessage': isUserMessage,
//       'timestamp': DateTime.now(), // Add a timestamp here
//     });
//   }
// }
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import '../chat/Messages.dart';

class chatbot extends StatefulWidget {
  const chatbot({Key? key}) : super(key: key);

  @override
  _ChatbotState createState() => _ChatbotState();
}

class _ChatbotState extends State<chatbot> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();

  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NutriBot'),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.deepPurple.shade800,
              Colors.deepPurple.shade500,
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: MessagesScreen(messages: messages),
            ),
            Container(
              color: Colors.deepPurple,
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                        hintStyle: TextStyle(color: Colors.white70),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      sendMessage(_controller.text);
                      _controller.clear();
                    },
                    icon: Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  sendMessage(String text) async {
    if (text.isEmpty) {
      print('Message is empty');
    } else {
      setState(() {
        addMessage(Message(text: DialogText(text: [text])), true);
      });

      DetectIntentResponse response = await dialogFlowtter.detectIntent(
        queryInput: QueryInput(text: TextInput(text: text)),
      );

      if (response.message == null) return;

      setState(() {
        addMessage(response.message!);
      });
    }
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({
      'message': message,
      'isUserMessage': isUserMessage,
      'timestamp': DateTime.now(), // Add a timestamp here
    });
  }
}
