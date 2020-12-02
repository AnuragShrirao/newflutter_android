import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:newflutter_android/Screen/image_preview.dart';
import 'package:newflutter_android/Screen/my_cart_page.dart';
import 'package:newflutter_android/Screen/notification_page.dart';

var no = 1;
var total = 0;
var charge = 20;
var discountPrice = 0;
var offer;

class ServiceDetailsPage extends StatefulWidget {
  final heroTag;
  final productDetailDetails;
  final productDetailName;
  final productDetailPrice;
  final productDetailOldPrice;

  // final productDetailPicture;
  var productDetailQuantity;

  ServiceDetailsPage(
      {this.heroTag,
      this.productDetailName,
      this.productDetailOldPrice,
      this.productDetailPrice,
      this.productDetailDetails,
      this.productDetailQuantity});

  @override
  _ServiceDetailsPageState createState() => _ServiceDetailsPageState();
}

class _ServiceDetailsPageState extends State<ServiceDetailsPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 100),
      vsync: this,
      upperBound: 0.1,
      lowerBound: 0.0,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    no = widget.productDetailQuantity;
    discountPrice = int.parse(widget.productDetailOldPrice) -
        int.parse(widget.productDetailPrice);
    charge = 20;
    offer = (100 -
            ((int.parse(widget.productDetailPrice) /
                    int.parse(widget.productDetailOldPrice)) *
                100))
        .round();
    total = int.parse(widget.productDetailPrice) * no + charge;
    if (total <= 300) {
      charge = 20;
      total = int.parse(widget.productDetailPrice) * no + charge;
    } else {
      charge = 0;
      total = int.parse(widget.productDetailPrice) * no;
    }
    var scale = 1 - _animationController.value;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.09,
        title: Text("ETROPLUS"),
        actions: <Widget>[
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
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                GestureDetector(
                  onTapUp: _onTapUp,
                  onTapDown: _onTapDown,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => ImagePreview()));
                  },
                  child: Transform.scale(
                    scale: scale,
                    child: Hero(
                      tag: widget.heroTag,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.33,
                          width: double.infinity,
                          child: Image(
                            image: AssetImage("image/etroplus.jpeg"),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  widget.productDetailName,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                ListTile(
                  title: Row(
                    children: <Widget>[
                      Icon(
                        Icons.local_offer,
                        color: Colors.green,
                      ),
                      Text(
                        "\u20B9 " + widget.productDetailPrice,
                        style: TextStyle(
                          // color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                          "\u20B9 " + widget.productDetailOldPrice,
                          style: TextStyle(
                              fontSize: 15,
                              decoration: TextDecoration.lineThrough),
                        ),
                      ),
                      Expanded(
                          child: Text(
                        "Save \u20B9 ${discountPrice.toString()}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Colors.greenAccent),
                      )),
                      AvatarGlow(
                        endRadius: 40,
                        glowColor: Colors.red,
                        child: CircleAvatar(
                          child: Text(
                            "$offer% off",
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          radius: 20,
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    "Details :",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  subtitle: Text(
                    widget.productDetailDetails,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                ),
                Divider(),
                Row(
                  children: <Widget>[
                    Text("    "),
                    Text(
                      "Quantity",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text("                                                  "),
                    IconButton(
                      icon: CircleAvatar(
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () {
                        setState(() {
                          if (widget.productDetailQuantity == 1) {
                          } else {
                            widget.productDetailQuantity--;
                          }
                        });
                      },
                    ),
                    Text(
                      no.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    IconButton(
                      icon: CircleAvatar(
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () {
                        setState(() {
                          widget.productDetailQuantity++;
                        });
                      },
                    ),
                  ],
                ),
                Divider(),
                Text(
                  "   Items Total : ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "    item price             =",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.productDetailPrice,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "    No of items          =",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      no.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "    Service Charge    =",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      charge.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "    Total                 =",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      total.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
                Divider(),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  splashColor: Colors.black,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Proceed to Order"),
                            actions: [
                              RaisedButton(
                                child: Text("Continue"),
                                onPressed: () {
                                  Navigator.pop(context);
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => Information(
                                  //       orderName: widget.productDetailName,
                                  //       orderPrice: total,
                                  //     ),
                                  //   ),
                                  // );
                                },
                                color: Colors.greenAccent,
                              ),
                              RaisedButton(
                                child: Text("Cancel"),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                color: Colors.red,
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  elevation: 0.2,
                  child: Text("Buy Now"),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  splashColor: Colors.black,
                  onPressed: () {
                    // showToast(
                    //   "Successfully Added to Cart",
                    //   context: context,
                    //   backgroundColor: Colors.lightBlueAccent,
                    //   position: StyledToastPosition.center,
                    // );
                    // Provider.of<CartProduct>(context, listen: false).addTask(
                    //     image: widget.productDetailPicture,
                    //     quantity: no.toString(),
                    //     price: int.parse(widget.productDetailPrice) * no,
                    //     name: widget.productDetailName);
                  },
                  color: Colors.orangeAccent,
                  textColor: Colors.white,
                  elevation: 0.2,
                  child: Text("Add to Cart"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

//Below method are for animation on image when onTap function is called..

  // ignore: non_constant_identifier_names
  void _onTapUp(TapDownDetails) {
    _animationController.reverse();
  }

  // ignore: non_constant_identifier_names
  void _onTapDown(TapDownDetails) {
    _animationController.forward();
  }
}
