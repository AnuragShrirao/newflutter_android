import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServiceList extends StatelessWidget {
  final categoryName;

  ServiceList({this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.09,
        title: Text(categoryName),
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
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image:AssetImage("image/etroplus.jpeg"),
                        )
                    ),
                  ),
                  flex: 2,
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Text("adddaa"),
                      Text("sfs"),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// https://firebasestorage.googleapis.com/v0/b/shopapp-354c8.appspot.com/o/all%2F5.jpg?alt=media&token=a4e6200a-2aa8-480e-8c49-7df4db709744
