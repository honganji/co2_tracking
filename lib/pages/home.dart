import 'package:co2_tracking/components/prop_box.dart';
import 'package:co2_tracking/constant/data.dart';
import 'package:co2_tracking/pages/stats.dart';
import 'package:co2_tracking/pages/stats_v2.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("My Emission", style: TextStyle(fontSize: 18),),
          StatsV2(inputData: dataList1),
          Text("Average Emission", style: TextStyle(fontSize: 18),),
          StatsV2(inputData: dataList2),
          const PropBoxes(),

          // Third Box: "Actions"
          Text(
            'Actions',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8), // Spacing before bullet points

          // Bullets with random sentences
          Container(
            color: Colors.grey[200],
            // padding: EdgeInsets.all(8),
            // margin: EdgeInsets.symmetric(vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BulletPoint(
                    text:
                        'EcoCommute'),
                BulletPoint(text: 'GreenOffice'),
                BulletPoint(text: 'SmartBites'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BulletPoint extends StatelessWidget {
  final String text;

  const BulletPoint({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('• ', style: TextStyle(fontSize: 16)), // Bullet point
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
