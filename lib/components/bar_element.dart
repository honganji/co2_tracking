import 'package:co2_tracking/constant/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

BarChartRodData getBarChartRodData(List<double> data, double width) {
  final barsWidth = width;
  List<BarChartRodStackItem> itemList = createRodStackItems(data, colorList);
  return BarChartRodData(
    toY: data.reduce((a, b) => a + b),
    rodStackItems: itemList,
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(8),
      topRight: Radius.circular(8),
    ),
    width: barsWidth,
  );
}

List<BarChartRodStackItem> createRodStackItems(
    List<double> values, List<Color> colors) {
  double currentSum = 0;

  return List<BarChartRodStackItem>.generate(values.length, (index) {
    double from = currentSum;
    double to = currentSum + values[index];
    currentSum = to;

    return BarChartRodStackItem(from, to, colors[index]);
  });
}
