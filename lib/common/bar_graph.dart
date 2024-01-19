import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:teste/common/bar_data.dart';

class BarGraph extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  BarGraph({super.key, required this.weekklySumary});

  final List weekklySumary;

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
      sunAmount: weekklySumary[0],
      monAmount: weekklySumary[1],
      tueAmount: weekklySumary[2],
      wedAmount: weekklySumary[3],
      thurAmount: weekklySumary[4],
      friAmount: weekklySumary[5],
      satAmount: weekklySumary[6],
    );
    myBarData.initializeBarData();
    return BarChart(
      BarChartData(
        maxY: 100,
        minY: 0,
        barGroups: myBarData.barData
            .map(
              (data) => BarChartGroupData(x: data.x, barRods: [BarChartRodData(toY: data.y)]),
            )
            .toList(),
      ),
    );
  }
}
