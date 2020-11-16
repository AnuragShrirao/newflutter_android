import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:newflutter_android/Screen/my_cart_page.dart';
import 'package:newflutter_android/Screen/service_list.dart';
import 'package:newflutter_android/Screen/notification_page.dart';
class FrontPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.18,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "ETROPLUS",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
                InkWell(
                  child: Icon(
                    Icons.notifications,
                    size: 28,
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationPage(),),);
                  },
                ),
                InkWell(
                  child: Icon(
                    Icons.shopping_cart,
                    size: 28,
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MyCart(),),);
                  },
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.06,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.33,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(56),
              ),
              child: Carousel(
                borderRadius: true,
                radius: Radius.circular(15),
                boxFit: BoxFit.fitWidth,
                images: [
                  AssetImage("image/etroplus.jpeg"),
                  AssetImage("image/etroplus.jpeg"),
                  AssetImage("image/etroplus.jpeg"),
                  AssetImage("image/etroplus.jpeg"),
                  AssetImage("image/etroplus.jpeg"),
                  AssetImage("image/etroplus.jpeg"),
                ],
                autoplay: false,
                dotBgColor: Colors.transparent,
                animationCurve: Curves.fastOutSlowIn,
                animationDuration: Duration(milliseconds: 3000),
                dotSize: 6.0,
                dotColor: Colors.blue,
                indicatorBgPadding: 8.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: Container(
              height: 300,
              // height: MediaQuery.of(context).size.height*0.4,
              child: Card(
                elevation: 2,
                color: Colors.white,
                child:
                Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Carousel(
                          borderRadius: true,
                          radius: Radius.circular(20),
                          boxFit: BoxFit.fill,
                          images: [
                            AssetImage("image/etroplus3.jpeg"),
                            AssetImage("image/etroplus3.jpeg"),
                            AssetImage("image/etroplus3.jpeg"),
                            AssetImage("image/etroplus3.jpeg"),

                          ],
                          autoplay: true,
                          dotBgColor: Colors.transparent,
                          animationCurve: Curves.fastOutSlowIn,
                          animationDuration: Duration(milliseconds: 2000),
                          dotSize: 0.0,
                          dotColor: Colors.blue,
                          indicatorBgPadding: 8.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      _boxContainer(),
                      _boxContainer(),
                      _boxContainer(),
                      _boxContainer(),
                    ],
                  ),
                  Row(
                    children: [
                      _boxContainer(),
                      _boxContainer(),
                      _boxContainer(),
                      _boxContainer(),
                    ],
                  ),
                ]),
              ),
            ),
          ),
          ServiceContainer(
            serviceCategory: "Beauty Service",
            serviceName1: "Body Spa",
            color: Colors.limeAccent,
            onTap: ServiceList(categoryName: "Beauty Services",),
            serviceName2: "Hair Spa",
          ),
          ServiceContainer(
            serviceCategory: "Cake Service",
            serviceName1: "Black Forest Cake",
            serviceName2: "Choco Vanilla Cake",
            color: Colors.purpleAccent,
            onTap: ServiceList(categoryName: "Cakes and Bakery Product",),
          ),
          ServiceContainer(
            serviceCategory: "Electric Service",
            serviceName1: "Fan Installation",
            serviceName2: "Inverter Installation",
            color: Colors.cyanAccent,
            onTap: ServiceList(categoryName: "Electric Services",),
          ),
          ServiceContainer(
            serviceCategory: "Plumber Service",
            serviceName1: "Refrigerator Installation",
            serviceName2: "AC Repair",
            color: Colors.orangeAccent,
            onTap: ServiceList(categoryName: "Plumber Service",),
          ),

        ],
      ),
    );

  }
}

//Methods ---

class ServiceContainer extends StatelessWidget {
  final color;
  final onTap;
  final serviceCategory;
  final serviceName1;
  final serviceName2;

  ServiceContainer(
      {this.serviceName1,
        this.serviceName2,
        this.serviceCategory,
        this.onTap,
        this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.45,
      child: Card(
        color: Colors.white,
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListTile(
              title: Text(
                serviceCategory,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              subtitle: Text("Deals with Exciting rates"),
            ),
            Row(
              children: [
                service(
                  context,
                  color,
                  serviceName1,
                ),
                service(
                  context,
                  color,
                  serviceName2,
                ),
              ],
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => onTap));
              },
              child: Text("View All Services",style: TextStyle(fontSize: 17,),),
              color: Colors.lightBlueAccent,
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}

_boxContainer() {
  return Expanded(
    flex: 1,
    child: Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        border: Border.all(
          color: Colors.black38,
        ),
      ),
      child: RaisedButton(
          color: Colors.white,
          splashColor: Colors.black,
          onPressed: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.supervisor_account_sharp),
              FittedBox(
                child: Text(
                  "Electrician",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )),
    ),
  );
}

Expanded service(
    BuildContext context,
    Color color,
    String serviceName,
    ) {
  return Expanded(
    flex: 1,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {},
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("image/etroplus.jpeg"),
                )
                // color: color,
              ),
            ),
            Center(
                child: FittedBox(
                  child: Text(
                    serviceName,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                )),
          ],
        ),
      ),
    ),
  );
}
