import 'package:co2_tracking/components/prop_box.dart';
import 'package:co2_tracking/constant/data.dart';
import 'package:co2_tracking/pages/stats_v2.dart';
import 'package:flutter/material.dart';

class Stats extends StatelessWidget {
  const Stats({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const Text(
          'Hello Mannheim!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        // Winner Department Text
        const Text(
          'Winner Department',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SALES',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 8),
            Icon(Icons.star, color: Colors.orangeAccent),
            Icon(Icons.star, color: Colors.orangeAccent),
          ],
        ),
        StatsV2(inputData: dataList1),
        // Your Department Graph Box
        const Text(
          'Your Department',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        StatsV2(inputData: dataList2),
        const PropBoxes(),
      ],
    );
  }
}
