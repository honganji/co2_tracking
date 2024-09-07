import 'package:co2_tracking/components/bar_chart_group_data_list.dart';
import 'package:co2_tracking/components/bar_element.dart';
import 'package:co2_tracking/constant/colors.dart';
import 'package:co2_tracking/constant/data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StatsV2 extends StatefulWidget {
  final List<List<double>> inputData;
  const StatsV2({super.key, required this.inputData});

  State<StatefulWidget> createState() => StatsV2State();
}

class StatsV2State extends State<StatsV2> {
  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 10);
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Apr';
        break;
      case 1:
        text = 'May';
        break;
      case 2:
        text = 'Jun';
        break;
      case 3:
        text = 'Jul';
        break;
      case 4:
        text = 'Aug';
        break;
      case 5:
        text = 'Sep';
        break;
      default:
        text = '';
        break;
    }
    return RotatedBox(
      quarterTurns: 3,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 11.0),
        child: SideTitleWidget(
          axisSide: meta.axisSide,
          child: Text(text, style: style),
        ),
      ),
    );
  }

  Widget topTitles(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 10);
    String text;
    text = '${widget.inputData[value.toInt()].reduce((a, b) => a + b).toInt()}kg';
    return RotatedBox(
      quarterTurns: 3,
      child: Padding(
        padding: const EdgeInsets.only(top: 6),
        child: SideTitleWidget(
          axisSide: meta.axisSide,
          child: Text(text, style: style),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.66,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final barsSpace = 12.0 * constraints.maxWidth / 400;
                final barsWidth = 32.0 * constraints.maxWidth / 400;
                return RotatedBox(
                  quarterTurns: 1,
                  child: BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.center,
                      barTouchData: BarTouchData(
                        enabled: false,
                      ),
                      titlesData: FlTitlesData(
                        show: true,
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 40,
                            getTitlesWidget: bottomTitles,
                          ),
                        ),
                        leftTitles: const AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: false,
                            reservedSize: 40,
                          ),
                        ),
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: false,
                            reservedSize: 40,
                          ),
                        ),
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 40,
                            getTitlesWidget: topTitles,
                          ),
                        ),
                      ),
                      gridData: FlGridData(
                        show: false,
                        checkToShowHorizontalLine: (value) => value % 10 == 0,
                        getDrawingHorizontalLine: (value) => FlLine(
                          color: colorList[0],
                          strokeWidth: 1,
                        ),
                        drawVerticalLine: false,
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      groupsSpace: barsSpace,
                      barGroups: getData(widget.inputData, barsWidth, barsSpace),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<BarChartGroupData> getData(List<List<double>> dataList, double barsWidth, double barsSpace) {
    return getBarChartGroupDataList(dataList, barsSpace, barsWidth);
  }
}
