import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Profile Picture with notification badge
            const Stack(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/profile_picture.png'), // You can replace this with your asset
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.red,
                    child: Text(
                      '6',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Name (Non-editable box)
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Name', style: TextStyle(fontSize: 16)),
            ),
            const _InfoBox(text: 'Not editable'),
            const SizedBox(height: 20),
            // Username (Editable box)
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Username', style: TextStyle(fontSize: 16)),
            ),
            const _InfoBox(text: 'Enter username'),
            const SizedBox(height: 20),
            // Country (Editable box)
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Country', style: TextStyle(fontSize: 16)),
            ),
            const _InfoBox(text: 'Enter country'),
            const SizedBox(height: 20),
            // Department (Editable box)
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Dept.', style: TextStyle(fontSize: 16)),
            ),
            const _InfoBox(text: 'Enter department'),
            const SizedBox(height: 20),
            // Delete Account Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                // primary: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              onPressed: () {
                // Handle delete account action
              },
              child: const Text('Delete Account'),
            ),
          ],
        ),
      ),
    );
  }
}

// Info box widget for non-editable fields
class _InfoBox extends StatelessWidget {
  final String text;

  const _InfoBox({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
