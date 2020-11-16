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

  ServiceDetailsPage({this.heroTag});

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
          GestureDetector(
            onTapUp: _onTapUp,
            onTapDown: _onTapDown,
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => ImagePreview()));
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
          )
        ],
      ),
    );
  }

  void _onTapUp(TapDownDetails) {
    _animationController.reverse();
  }

  void _onTapDown(TapDownDetails) {
    _animationController.forward();
  }
}
