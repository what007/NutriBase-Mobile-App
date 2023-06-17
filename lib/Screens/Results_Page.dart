// import 'package:demoapp/Components/BottomContainer_Button.dart';
// import 'package:demoapp/constants.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:intl/intl.dart';
// import '../Components/Reusable_Bg.dart';

// class ResultPage extends StatelessWidget {
//   final String resultText;
//   final String bmi;
//   final String advise;
//   final Color textColor;

//   ResultPage({
//     required this.textColor,
//     required this.resultText,
//     required this.bmi,
//     required this.advise,
//   });

//   Future<void> saveResultToFirebase() async {
//     try {
//       final user = FirebaseAuth.instance.currentUser;
//       if (user != null) {
//         final uid = user.uid;
//         final formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
//         await FirebaseFirestore.instance.collection('bmiResults').add({
//           'uid': uid,
//           'bmi': bmi,
//           'resultText': resultText,
//           'advise': advise,
//           // 'timestamp': FieldValue.serverTimestamp(),
//           'date': formattedDate,
//         });
//         print('BMI result saved to Firebase');
//       }
//     } catch (e) {
//       print('Error saving BMI result: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(
//           child: Text('BMI CALCULATOR'),
//         ),
//       ),
//       body: Container(
//         color: Color.fromARGB(
//             255, 104, 94, 94), // Set your desired background color here
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Expanded(
//               child: Container(
//                 padding: EdgeInsets.all(15.0),
//                 alignment: Alignment.bottomCenter,
//                 child: Text(
//                   'Your Result',
//                   style: ktitleTextStyle,
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 5,
//               child: ReusableBg(
//                 colour: kactiveCardColor,
//                 cardChild: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text(
//                       resultText,
//                       style: TextStyle(
//                         color: textColor,
//                         fontSize: 27.0,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text(
//                       bmi,
//                       style: kBMITextStyle,
//                     ),
//                     Text(
//                       'Normal BMI range:',
//                       style: klabelTextStyle,
//                     ),
//                     Text(
//                       '18.5 - 25 kg/m2',
//                       style: kBodyTextStyle,
//                     ),
//                     Text(
//                       advise,
//                       textAlign: TextAlign.center,
//                       style: kBodyTextStyle,
//                     ),
//                     SizedBox(
//                       height: 15.0,
//                     ),
//                     RawMaterialButton(
//                       onPressed: () {
//                         saveResultToFirebase();
//                       },
//                       constraints: BoxConstraints.tightFor(
//                         width: 200.0,
//                         height: 56.0,
//                       ),
//                       fillColor: Color.fromARGB(255, 122, 128, 157),
//                       elevation: 0.0,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                       child: Text(
//                         'SAVE RESULT',
//                         style: kBodyTextStyle,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             BottomContainer(
//               text: 'RE-CALCULATE',
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:demoapp/Components/BottomContainer_Button.dart';
import 'package:demoapp/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import '../Components/Reusable_Bg.dart';

class ResultPage extends StatefulWidget {
  final String resultText;
  final String bmi;
  final String advise;
  final Color textColor;

  ResultPage({
    required this.textColor,
    required this.resultText,
    required this.bmi,
    required this.advise,
  });

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final TextEditingController dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    dateController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
  }

  Future<void> saveResultToFirebase() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final uid = user.uid;
        final formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
        await FirebaseFirestore.instance.collection('bmiResults').add({
          'uid': uid,
          'bmi': widget.bmi,
          'resultText': widget.resultText,
          'advise': widget.advise,
          //  'timestamp': FieldValue.serverTimestamp(),
          'date': formattedDate,
        });
        print('BMI result saved to Firebase');
      }
    } catch (e) {
      print('Error saving BMI result: $e');
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        dateController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Container(
        color: Color.fromARGB(
          255,
          104,
          94,
          94,
        ), // Set your desired background color here
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Your Result',
                  style: ktitleTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableBg(
                colour: kactiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.resultText,
                      style: TextStyle(
                        color: widget.textColor,
                        fontSize: 27.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.bmi,
                      style: kBMITextStyle,
                    ),
                    Text(
                      'Normal BMI range:',
                      style: klabelTextStyle,
                    ),
                    Text(
                      '18.5 - 25 kg/m2',
                      style: kBodyTextStyle,
                    ),
                    Text(
                      widget.advise,
                      textAlign: TextAlign.center,
                      style: kBodyTextStyle,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      readOnly: true,
                      controller: dateController,
                      onTap: () {
                        _selectDate(context);
                      },
                      decoration: InputDecoration(
                        labelText: 'Date',
                        suffixIcon: Icon(Icons.calendar_today),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    RawMaterialButton(
                      onPressed: () {
                        saveResultToFirebase();
                      },
                      constraints: BoxConstraints.tightFor(
                        width: 200.0,
                        height: 56.0,
                      ),
                      fillColor: Color.fromARGB(255, 122, 128, 157),
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        'SAVE RESULT',
                        style: kBodyTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BottomContainer(
              text: 'RE-CALCULATE',
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
