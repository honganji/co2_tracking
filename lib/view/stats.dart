import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Stats extends StatelessWidget {
  const Stats({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50], // Light purple background
      appBar: AppBar(
        title: Text('Stacked Bar Chart Example'),
      ),
      body: Column(
        children: [
          Expanded(
            child: RotatedBox(
              quarterTurns: 1,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 200,
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (double value, TitleMeta meta) {
                      const style = TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      );
                      Widget text;
                      switch (value.toInt()) {
                        case 0:
                          text = Text('Jan', style: style);
                          break;
                        case 1:
                          text = Text('Feb', style: style);
                          break;
                        case 2:
                          text = Text('Mar', style: style);
                          break;
                        case 3:
                          text = Text('Apr', style: style);
                          break;
                        case 4:
                          text = Text('May', style: style);
                          break;
                        case 5:
                          text = Text('Jun', style: style);
                          break;
                        default:
                          text = Text('', style: style);
                          break;
                      }
                      return SideTitleWidget(
                        axisSide: meta.axisSide,
                        space: 16,
                        child: text,
                      );
                    },
                  ),
                ),
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: [
                    makeGroupData(0, 70, 50, 20, 60),
                    makeGroupData(1, 50, 80, 30, 60),
                    makeGroupData(2, 40, 80, 80, 50),
                    makeGroupData(3, 60, 40, 20, 90),
                    makeGroupData(4, 50, 50, 70, 40),
                    makeGroupData(5, 60, 70, 50, 30),
                  ],
                  gridData: FlGridData(show: false),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Indicator(color: Colors.deepPurple, text: 'Cream'),
              const SizedBox(width: 10),
              Indicator(color: Colors.purple, text: 'Moisturizer'),
              const SizedBox(width: 10),
              Indicator(color: Colors.pink, text: 'Sunscreen'),
              const SizedBox(width: 10),
              Indicator(color: Colors.pinkAccent, text: 'Shampoo'),
            ],
          ),
        ],
      ),
    );
  }

  BarChartGroupData makeGroupData(
      int x, double y1, double y2, double y3, double y4) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: Colors.deepPurple,
          width: 22,
        ),
        BarChartRodData(
          toY: y2,
          color: Colors.purple,
          width: 22,
        ),
        BarChartRodData(
          toY: y3,
          color: Colors.pink,
          width: 22,
        ),
        BarChartRodData(
          toY: y4,
          color: Colors.pinkAccent,
          width: 22,
          borderRadius: const BorderRadius.all(Radius.circular(6)),
        ),
      ],
    );
  }
}

class Indicator extends StatelessWidget {
  final Color color;
  final String text;

  const Indicator({
    Key? key,
    required this.color,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
