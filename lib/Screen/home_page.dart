import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'booking_page.dart';
import 'front_page.dart';
import 'help_page.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex=0;
  static  List<Widget> _screen =<Widget>[
    FrontPage(),
    Booking(),
    Help(),
    Profile(),
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _screen.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.assignment_turned_in),label: "Booking",),
            BottomNavigationBarItem(icon: Icon(Icons.help),label: "Help",),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle),label: "Profile",),
          ],
          unselectedItemColor: Colors.black,
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
        ),
      ),
    );
  }
}
