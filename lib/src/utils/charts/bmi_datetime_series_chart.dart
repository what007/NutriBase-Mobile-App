import 'package:charts_flutter/flutter.dart' as charts;
import 'package:demoapp/src/model/bmi_track_task.dart';
import 'package:flutter/material.dart';

class BMIDateTimeSeriesChart extends StatefulWidget {
  final List<BMITrackTask> data;
  final String chartTitle;

  BMIDateTimeSeriesChart({
    required this.data,
    required this.chartTitle,
  });

  @override
  _BMIDateTimeSeriesChartState createState() => _BMIDateTimeSeriesChartState();
}

class _BMIDateTimeSeriesChartState extends State<BMIDateTimeSeriesChart> {
  List<charts.Series<BMITrackTask, DateTime>>? chartData;

  @override
  void initState() {
    super.initState();
    populateChartWithEntries();
  }

  void populateChartWithEntries() {
    setState(() {
      chartData = [
        charts.Series<BMITrackTask, DateTime>(
          id: 'BMI Track Entries',
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
          domainFn: (BMITrackTask task, _) => task.date,
          measureFn: (BMITrackTask task, _) => task.bmi,
          data: widget.data,
        ),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    if (chartData != null) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.chartTitle),
              Padding(
                padding: EdgeInsets.all(32.0),
                child: SizedBox(
                  height: 300.0,
                  child: charts.TimeSeriesChart(
                    chartData!,
                    animate: true,
                    domainAxis: charts.DateTimeAxisSpec(
                      renderSpec:
                          charts.SmallTickRendererSpec(labelRotation: 45),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return CircularProgressIndicator();
    }
  }
}
