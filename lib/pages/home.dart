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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("My Emission", style: TextStyle(fontSize: 18),),
          StatsV2(inputData: dataList1),
          const PropBoxes(),
          SizedBox(height: 10,),
          Text("Personal Forest", style: TextStyle(fontSize: 18),),
          SizedBox(height: 10,),
          Row(
            children: [
              Spacer(),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xF084ACD4),
                  borderRadius: BorderRadius.circular(16.0), // Rounded corners
                ),
                height: 170,
                width: MediaQuery.of(context).size.width * 3 / 4,
                child: Column(
                  children: [
                    Text(
                      "Take a trip to your personal forest\nEvery time you reduce your CO2\nemissions by 21kgs a new tree will be apear in this section!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black45
                      ),
                      ),
                    Expanded(
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage('assets/images/Tree.png'), // Replace with your image path
                            width: 200, // Set the desired width
                            height: 200, // Set the desired height
                          ),
                          // ImageIcon(
                          //   AssetImage('assets/images/Tree.png'),
                          //   size: 45,
                          // ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Spacer(),
            ],
          ),
          SizedBox(height: 10,),
          // Third Box: "Actions"
          Text(
            'Actions',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomButton(label: 'eCommute'),
                SizedBox(height: 8), // Space between buttons
                CustomButton(label: 'Green Office'),
                SizedBox(height: 16),
                CustomButton(label: 'Smart Bites'),
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

class CustomButton extends StatelessWidget {
  final String label;

  const CustomButton({required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 3 / 4,
      child: ElevatedButton(
        onPressed: () {
          // Define the action on button press here
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFF7F6F3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0), // Pill-shaped button
          ),
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0), // Size of the button
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.black, // Text color as seen in the image
          ),
        ),
      ),
    );
  }
}
