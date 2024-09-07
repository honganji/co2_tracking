import 'package:co2_tracking/pages/home.dart';
import 'package:co2_tracking/pages/profile.dart';
import 'package:co2_tracking/pages/stats.dart';
import 'package:co2_tracking/pages/stats_v2.dart';
import 'package:flutter/material.dart';

class Base extends StatefulWidget {
  @override
  _BaseState createState() => _BaseState();
}

class _BaseState extends State<Base> {
  int _selectedIndex = 0;

  // List of screens to transition between
  final List<Widget> _screens = [
    const Home(),
    const Profile(),
    const Stats()
    // const StatsV2()
  ];

  // List of Title to transition between
  final List<String> _titles = [
    "Home",
    "Profile",
    "Stats",
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 70,
            padding: EdgeInsets.only(top: 10, left: 20),
            width: double.infinity,
            color: Colors.blueGrey,
            child: Text(
                  _titles[_selectedIndex],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          ),
          ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: Container(
            color: Colors.white,
            height: 50,
          ),
        ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: _screens[_selectedIndex]
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? const ImageIcon(AssetImage('assets/images/home_selected.png'))
                : const ImageIcon(AssetImage('assets/images/home_unselected.png')),
            label: _titles[0],
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? const ImageIcon(AssetImage('assets/images/user_selected.png'))
                : const ImageIcon(AssetImage('assets/images/user_unselected.png')),
            label: _titles[1],
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? const ImageIcon(AssetImage('assets/images/analytics_selected.png'))
                : const ImageIcon(AssetImage('assets/images/analytics_unselected.png')),
            label: _titles[2],
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF577C8E),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 50);  // Start from a point a little below the top-left corner
    path.quadraticBezierTo(
        size.width / 2, 0, size.width, 50);  // Create the curved path at the top
    path.lineTo(size.width, size.height);  // Draw a straight line to the bottom-right
    path.lineTo(0, size.height);  // Draw a line to the bottom-left
    path.close();  // Close the path
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
