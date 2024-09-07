import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StatsV2 extends StatefulWidget {
  StatsV2({super.key});

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
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    if (value == meta.max) {
      return Container();
    }
    const style = TextStyle(
      fontSize: 10,
    );
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        meta.formattedValue,
        style: style,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.66,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final barsSpace = 4.0 * constraints.maxWidth / 400;
            final barsWidth = 8.0 * constraints.maxWidth / 400;
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
                        reservedSize: 28,
                        getTitlesWidget: bottomTitles,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: leftTitles,
                      ),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  gridData: FlGridData(
                    show: true,
                    checkToShowHorizontalLine: (value) => value % 10 == 0,
                    getDrawingHorizontalLine: (value) => FlLine(
                      color: Colors.black26,
                      strokeWidth: 1,
                    ),
                    drawVerticalLine: false,
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  groupsSpace: barsSpace,
                  barGroups: getData(barsWidth, barsSpace),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  List<BarChartGroupData> getData(double barsWidth, double barsSpace) {
    return [
      BarChartGroupData(
        x: 0,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            toY: 24000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 13000000000, Colors.black26),
              BarChartRodStackItem(13000000000, 14000000000, Colors.black),
              BarChartRodStackItem(14000000000, 24000000000, Colors.white24),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 23000000000.5,
            rodStackItems: [
              BarChartRodStackItem(0, 6000000000.5, Colors.black26),
              BarChartRodStackItem(6000000000.5, 18000000000, Colors.black),
              BarChartRodStackItem(18000000000, 23000000000.5, Colors.white24),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 29000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 9000000000, Colors.black26),
              BarChartRodStackItem(9000000000, 15000000000, Colors.black),
              BarChartRodStackItem(15000000000, 29000000000, Colors.white24),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 32000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 2000000000.5, Colors.black26),
              BarChartRodStackItem(2000000000.5, 17000000000.5, Colors.black),
              BarChartRodStackItem(17000000000.5, 32000000000, Colors.white24),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
        ],
      ),
      BarChartGroupData(
        x: 1,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            toY: 31000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 11000000000, Colors.black26),
              BarChartRodStackItem(11000000000, 18000000000, Colors.black),
              BarChartRodStackItem(18000000000, 31000000000, Colors.white24),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 35000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 14000000000, Colors.black26),
              BarChartRodStackItem(14000000000, 27000000000, Colors.black),
              BarChartRodStackItem(27000000000, 35000000000, Colors.white24),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 31000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 8000000000, Colors.black26),
              BarChartRodStackItem(8000000000, 24000000000, Colors.black),
              BarChartRodStackItem(24000000000, 31000000000, Colors.white24),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 15000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 6000000000.5, Colors.black26),
              BarChartRodStackItem(6000000000.5, 12000000000.5, Colors.black),
              BarChartRodStackItem(12000000000.5, 15000000000, Colors.white24),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 17000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 9000000000, Colors.black26),
              BarChartRodStackItem(9000000000, 15000000000, Colors.black),
              BarChartRodStackItem(15000000000, 17000000000, Colors.white24),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
        ],
      ),
      BarChartGroupData(
        x: 2,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            toY: 34000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 6000000000, Colors.black26),
              BarChartRodStackItem(6000000000, 23000000000, Colors.black),
              BarChartRodStackItem(23000000000, 34000000000, Colors.white24),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 32000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 7000000000, Colors.black26),
              BarChartRodStackItem(7000000000, 24000000000, Colors.black),
              BarChartRodStackItem(24000000000, 32000000000, Colors.white24),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 14000000000.5,
            rodStackItems: [
              BarChartRodStackItem(0, 1000000000.5, Colors.black26),
              BarChartRodStackItem(1000000000.5, 12000000000, Colors.black),
              BarChartRodStackItem(12000000000, 14000000000.5, Colors.white24),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 20000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 4000000000, Colors.black26),
              BarChartRodStackItem(4000000000, 15000000000, Colors.black),
              BarChartRodStackItem(15000000000, 20000000000, Colors.white24),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 24000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 4000000000, Colors.black26),
              BarChartRodStackItem(4000000000, 15000000000, Colors.black),
              BarChartRodStackItem(15000000000, 24000000000, Colors.white24),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
        ],
      ),
      BarChartGroupData(
        x: 3,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            toY: 14000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 1000000000.5, Colors.black26),
              BarChartRodStackItem(1000000000.5, 12000000000, Colors.black),
              BarChartRodStackItem(12000000000, 14000000000, Colors.white24),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 27000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 7000000000, Colors.black26),
              BarChartRodStackItem(7000000000, 25000000000, Colors.black),
              BarChartRodStackItem(25000000000, 27000000000, Colors.white24),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 29000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 6000000000, Colors.black26),
              BarChartRodStackItem(6000000000, 23000000000, Colors.black),
              BarChartRodStackItem(23000000000, 29000000000, Colors.white24),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 16000000000.5,
            rodStackItems: [
              BarChartRodStackItem(0, 9000000000, Colors.black26),
              BarChartRodStackItem(9000000000, 15000000000, Colors.black),
              BarChartRodStackItem(15000000000, 16000000000.5, Colors.white24),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 15000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 7000000000, Colors.black26),
              BarChartRodStackItem(7000000000, 12000000000.5, Colors.black),
              BarChartRodStackItem(12000000000.5, 15000000000, Colors.white24),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
        ],
      ),
    ];
  }
}
