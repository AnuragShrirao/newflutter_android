import 'package:flutter/material.dart';

class Booking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.09,
        title: Text(
          "My Bookings",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        actions: [
          InkWell(
            child: Icon(
              Icons.notifications,
              size: 28,
            ),
            onTap: () {},
          ),
          SizedBox(width: 10),
          InkWell(
            child: Icon(
              Icons.shopping_cart,
              size: 28,
            ),
            onTap: () {},
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}
