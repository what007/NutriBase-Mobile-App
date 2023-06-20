import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class BMITrackTask {
  final DateTime date;
  final double bmi;

  BMITrackTask({required this.date, required this.bmi});

  factory BMITrackTask.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    final String dateString = data['date'] as String;
    final String bmiString = data['bmi'] as String;

    DateTime parsedDate;
    try {
      parsedDate = DateFormat('yyyy-MM-dd').parse(dateString);
    } catch (e) {
      print('Error parsing date: $e');
      parsedDate = DateTime.now();
    }

    double parsedBmi;
    try {
      parsedBmi = double.parse(bmiString);
    } catch (e) {
      print('Error parsing BMI: $e');
      parsedBmi = 0.0;
    }

    return BMITrackTask(date: parsedDate, bmi: parsedBmi);
  }
}
