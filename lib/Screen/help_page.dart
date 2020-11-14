import 'package:flutter/material.dart';
class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.09,
        title: Text("Help",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
        actions: [ InkWell(
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
          SizedBox(width: 20),],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Contact Us",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),),),
          SizedBox(height: 10,),
          Center(child: SelectableText("Call Us - 9423985296 ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,),),),
          Center(child: SelectableText("E-mail - helpetroplus@gmail.com",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),),
          SizedBox(height: 10,),
          Center(child: Text("FAQ AND QUERIES",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),),
          SizedBox(height: 10,),
          Center(child: Text("TERMS AND CONDITIONS",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),),
        ],
      ),
    );
  }
}
