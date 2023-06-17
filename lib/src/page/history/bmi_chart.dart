// // // import 'package:demoapp/src/model/bmi_track_task.dart.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // import 'package:demoapp/src/utils/charts/datetime_series_chart.dart';
// // // import 'package:firebase_auth/firebase_auth.dart';

// // // class bmiChart extends StatefulWidget {
// // //   @override
// // //   _HistoryScreenState createState() => _HistoryScreenState();
// // // }

// // // class _HistoryScreenState extends State<bmiChart> {
// // //   final CollectionReference bmiCollection =
// // //       FirebaseFirestore.instance.collection('bmiResults');
// // //   final String uid = FirebaseAuth.instance.currentUser?.uid ?? '';

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text(
// // //           'History Screen',
// // //           style: TextStyle(
// // //             color: Colors.white,
// // //             fontSize: 20,
// // //             fontWeight: FontWeight.bold,
// // //           ),
// // //         ),
// // //       ),
// // //       body: StreamBuilder<QuerySnapshot>(
// // //         stream: bmiCollection.where('uid', isEqualTo: uid).snapshots(),
// // //         builder: (context, snapshot) {
// // //           if (snapshot.hasData) {
// // //             List<BMITrackTask> bmiTrackTasks = snapshot.data!.docs
// // //                 .map((doc) => BMITrackTask.fromSnapshot(doc))
// // //                 .toList();

// // //             return Container(
// // //               child: DateTimeChart(
// // //                 data: bmiTrackTasks,
// // //                 chartTitle: 'BMI History',
// // //                 xValueMapper: (BMITrackTask task, _) => task.date,
// // //                 yValueMapper: (BMITrackTask task, _) => task.bmi,
// // //               ),
// // //             );
// // //           } else if (snapshot.hasError) {
// // //             return Text('Error: ${snapshot.error}');
// // //           } else {
// // //             return CircularProgressIndicator();
// // //           }
// // //         },
// // //       ),
// // //     );
// // //   }
// // // }

// import 'package:demoapp/src/model/bmi_track_task.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:demoapp/src/utils/charts/bmi_datetime_series_chart.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class bmiChart extends StatefulWidget {
//   @override
//   _HistoryScreenState createState() => _HistoryScreenState();
// }

// class _HistoryScreenState extends State<bmiChart> {
//   final CollectionReference bmiCollection =
//       FirebaseFirestore.instance.collection('bmiResults');
//   final String uid = FirebaseAuth.instance.currentUser?.uid ?? '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'BMI Chart',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: bmiCollection.where('uid', isEqualTo: uid).snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             List<BMITrackTask> bmiTrackTasks = snapshot.data!.docs
//                 .map((doc) => BMITrackTask.fromSnapshot(doc))
//                 .toList();

//             return Container(
//               child: BMIDateTimeChart(
//                 data: bmiTrackTasks,
//                 chartTitle: 'BMI History',
//                 xValueMapper: (BMITrackTask task, _) => task.date,
//                 yValueMapper: (BMITrackTask task, _) => task.bmi,
//               ),
//             );
//           } else if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           } else {
//             return CircularProgressIndicator();
//           }
//         },
//       ),
//     );
//   }
// }

// // import 'package:demoapp/src/model/bmi_track_task.dart';
// // import 'package:flutter/material.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:demoapp/src/utils/charts/bmi_datetime_series_chart.dart';
// // import 'package:firebase_auth/firebase_auth.dart';

// // class bmiChart extends StatefulWidget {
// //   @override
// //   _bmiChartState createState() => _bmiChartState();
// // }

// // class _bmiChartState extends State<bmiChart> {
// //   final CollectionReference bmiCollection =
// //       FirebaseFirestore.instance.collection('bmiResults');
// //   final String uid = FirebaseAuth.instance.currentUser?.uid ?? '';

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(
// //           'BMI Chart',
// //           style: TextStyle(
// //             color: Colors.white,
// //             fontSize: 20,
// //             fontWeight: FontWeight.bold,
// //           ),
// //         ),
// //       ),
// //       body: StreamBuilder<QuerySnapshot>(
// //         stream: bmiCollection.where('uid', isEqualTo: uid).snapshots(),
// //         builder: (context, snapshot) {
// //           if (snapshot.hasData) {
// //             List<BMITrackTask> bmiTrackTasks = snapshot.data!.docs
// //                 .map((doc) => BMITrackTask.fromSnapshot(doc))
// //                 .toList();

// //             return Container(
// //               child: BMIDateTimeChart(
// //                 data: bmiTrackTasks,
// //                 chartTitle: 'BMI History',
// //                 xValueMapper: (BMITrackTask task, _) => task.date
// //                     .toDate(), // Extract the DateTime from the Timestamp
// //                 yValueMapper: (BMITrackTask task, _) => task.bmi,
// //               ),
// //             );
// //           } else if (snapshot.hasError) {
// //             return Text('Error: ${snapshot.error}');
// //           } else {
// //             return CircularProgressIndicator();
// //           }
// //         },
// //       ),
// //     );
// //   }
// // }

import 'package:demoapp/src/model/bmi_track_task.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demoapp/src/utils/charts/bmi_datetime_series_chart.dart';
import 'package:firebase_auth/firebase_auth.dart';

class bmiChart extends StatefulWidget {
  @override
  _BmiChartState createState() => _BmiChartState();
}

class _BmiChartState extends State<bmiChart> {
  final CollectionReference bmiCollection =
      FirebaseFirestore.instance.collection('bmiResults');
  final String uid = FirebaseAuth.instance.currentUser?.uid ?? '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Chart',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: bmiCollection
            .where('uid', isEqualTo: uid)
            .orderBy('date', descending: false)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<BMITrackTask> bmiTrackTasks = snapshot.data!.docs
                .map((doc) => BMITrackTask.fromSnapshot(doc))
                .toList();

            return Container(
              child: BMIDateTimeSeriesChart(
                data: bmiTrackTasks,
                chartTitle: 'BMI History',
              ),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
