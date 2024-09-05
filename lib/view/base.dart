import 'package:co2_tracking/view/home.dart';
import 'package:co2_tracking/view/profile.dart';
import 'package:co2_tracking/view/stats.dart';
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
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: _titles[0],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: _titles[1],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: _titles[2],
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
