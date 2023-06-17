import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessagesScreen extends StatefulWidget {
  final List messages;
  const MessagesScreen({Key? key, required this.messages}) : super(key: key);

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return ListView.separated(
      itemBuilder: (context, index) {
        var isUserMessage = widget.messages[index]['isUserMessage'];
        return Row(
          mainAxisAlignment:
              isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            if (!isUserMessage)
              CircleAvatar(
                backgroundImage: AssetImage(
                    'assets/robot.jpg'), // Set this to your android robot image
              ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(isUserMessage ? 0 : 20),
                  topLeft: Radius.circular(isUserMessage ? 20 : 0),
                ),
                color: isUserMessage
                    ? Colors.blue.shade800
                    : Colors.green.shade900.withOpacity(0.8),
              ),
              constraints: BoxConstraints(maxWidth: w * 2 / 3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.messages[index]['message'].text.text[0]),
                  Text(
                    widget.messages[index]['timestamp'] != null
                        ? DateFormat('dd MMM kk:mm')
                            .format(widget.messages[index]['timestamp'])
                        : '', // if timestamp is null, display an empty string
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            if (isUserMessage)
              CircleAvatar(
                backgroundImage: AssetImage(
                    'assets/default1.png'), // Set this to your user image
              ),
          ],
        );
      },
      separatorBuilder: (_, i) => Padding(padding: EdgeInsets.only(top: 10)),
      itemCount: widget.messages.length,
    );
  }
}
