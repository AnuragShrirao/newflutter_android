import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServiceList extends StatefulWidget {
  final categoryName;

  ServiceList({this.categoryName});

  @override
  _ServiceListState createState() => _ServiceListState();
}

class _ServiceListState extends State<ServiceList> {
  var itemNo = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.09,
        title: Text(widget.categoryName),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.15,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      // height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(23),
                          image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: AssetImage("image/etroplus.jpeg"),
                          )),
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FittedBox(
                            child: Text(
                          "Hair Spa(Short Hair)",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                        Text(
                          "Get Extra 30% benefits on Hair",
                          maxLines: 2,
                          style: TextStyle(fontSize: 15),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Icon(
                                Icons.local_offer,
                                color: Colors.green,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "\u20B9 300",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "\u20B9 200",
                                style: TextStyle(
                                    fontSize: 15,
                                    decoration: TextDecoration.lineThrough),
                              ),
                            ),
                            Expanded(
                              child: IconButton(
                                  icon: CircleAvatar(
                                    radius: 15,
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                    backgroundColor: Colors.blue,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      itemNo = itemNo + 1;
                                    });
                                  }),
                            ),
                            Text("$itemNo"),
                            Expanded(
                              child: IconButton(
                                  icon: CircleAvatar(
                                    radius: 15,
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    ),
                                    backgroundColor: Colors.blue,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      itemNo--;
                                    });
                                  }),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// https://firebasestorage.googleapis.com/v0/b/shopapp-354c8.appspot.com/o/all%2F5.jpg?alt=media&token=a4e6200a-2aa8-480e-8c49-7df4db709744
