import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newflutter_android/Screen/service_details_page.dart';

import 'my_cart_page.dart';
import 'notification_page.dart';

class ServiceList extends StatefulWidget {
  final categoryName;
  ServiceList({this.categoryName});

  @override
  _ServiceListState createState() => _ServiceListState();
}

class _ServiceListState extends State<ServiceList> {
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
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NotificationPage()));
            },
          ),
          SizedBox(width: 10),
          InkWell(
            child: Icon(
              Icons.shopping_cart,
              size: 28,
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyCart()));
            },
          ),
          SizedBox(width: 20),
        ],
      ),
      body: ListView(
        children: [
          SingleService(
            serviceImage: AssetImage("image/etroplus.jpeg"),
            serviceOldPrice: 500,
            servicePrice: 25,
            serviceSubTitle: "Get Extra 30% benefits on Hair",
            serviceTitle: "Hair Spa(Short Hair)",
          ),
          Divider(),
          SingleService(
            serviceImage: AssetImage("image/etroplus.jpeg"),
            serviceOldPrice: 500,
            servicePrice: 250,
            serviceSubTitle: "Get Extra 30% benefits on Hair",
            serviceTitle: "Hair Spa(Short)",
          ),
          Divider(),

          SingleService(
            serviceImage: AssetImage("image/etroplus.jpeg"),
            serviceOldPrice: 500,
            servicePrice: 250,
            serviceSubTitle: "Get Extra 30% benefits on Hair adhasd asdasdjsdnacn asckjajsdja"
                "asdkjasj   asdlkasdlkasd asdlkasdasd"
                "asdlkassdlkasdmasdkasd as"
                "sdasdasdasdsad"
                "",
            serviceTitle: "Hair Spa(Short Hairs)",
          ),
          Divider(),

          SingleService(
            serviceImage: AssetImage("image/etroplus.jpeg"),
            serviceOldPrice: 500,
            servicePrice: 250,
            serviceSubTitle: "Get Extra 30% benefits on Hair",
            serviceTitle: "Hair Spa (Short Hair)",
          ),
          Divider(),

          SingleService(
            serviceImage: AssetImage("image/etroplus.jpeg"),
            serviceOldPrice: 500,
            servicePrice: 250,
            serviceSubTitle: "Get Extra 30% benefits on Hair",
            serviceTitle: "Hair Spa(Short Hair) ",
          ),
          Divider(),

          SingleService(
            serviceImage: AssetImage("image/etroplus.jpeg"),
            serviceOldPrice: 500,
            servicePrice: 250,
            serviceSubTitle: "Get Extra 30% benefits on Hair",
            serviceTitle: "Hair Spa(Short Hair )",
          ),
          Divider(),

        ],
      ),
    );
  }
}




//Method for single service list

class SingleService extends StatefulWidget {
  final serviceTitle;
  final serviceSubTitle;
  final servicePrice;
  final serviceImage;
  final serviceOldPrice;

  SingleService(
      {this.serviceImage,
      this.serviceOldPrice,
      this.serviceSubTitle,
      this.servicePrice,
      this.serviceTitle});

  @override
  _SingleServiceState createState() => _SingleServiceState();
}

class _SingleServiceState extends State<SingleService> {
  var itemNo = 1;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ServiceDetailsPage(heroTag: widget.serviceTitle,productDetailName: widget.serviceTitle,productDetailOldPrice: widget.serviceOldPrice.toString(),productDetailPrice: widget.servicePrice.toString(),productDetailDetails: widget.serviceSubTitle,productDetailQuantity: itemNo,)));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 95,
          child: Row(
            children: [
              Expanded(
                child: Hero(
                  tag: widget.serviceTitle,
                  child: Container(
                    // height: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: widget.serviceImage,
                        )),
                  ),
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
                      widget.serviceTitle.toString(),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                    Text(
                      widget.serviceSubTitle.toString(),
                      maxLines: 1,
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
                            "\u20B9 " + widget.servicePrice.toString(),
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "\u20B9 " + widget.serviceOldPrice.toString(),
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
                                  if(itemNo!=1)
                                    {
                                      itemNo--;
                                    }
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
    );
  }
}
