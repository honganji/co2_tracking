import 'package:co2_tracking/view/base.dart';
import 'package:flutter/material.dart';

class CheerMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // Spacer to push content down
            Spacer(flex: 3),
            // Centered text
            const Text(
              "Let's\ndecarbonize!",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            // Spacer to push button down
            const Spacer(flex: 2),
            // Button at the bottom
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Base()));
                },
                child: Text('Next'),
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
