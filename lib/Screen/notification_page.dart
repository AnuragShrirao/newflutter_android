import 'package:flutter/material.dart';
class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.09,
        title: Text("Notifications",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
      ),
    );
  }
}