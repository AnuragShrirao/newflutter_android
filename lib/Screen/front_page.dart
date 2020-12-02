import 'package:avatar_glow/avatar_glow.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newflutter_android/Screen/booking_page.dart';
import 'package:newflutter_android/Screen/help_page.dart';
import 'package:newflutter_android/Screen/home_page.dart';
import 'package:newflutter_android/Screen/my_cart_page.dart';
import 'package:newflutter_android/Screen/profile_page.dart';
import 'package:newflutter_android/Screen/select_city.dart';
import 'package:newflutter_android/Screen/service_list.dart';
import 'package:newflutter_android/Screen/notification_page.dart';

import 'log_in_page.dart';

class FrontPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.blue,
        elevation: 1,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on_sharp,
                  size: 30,
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Select City "),
                          content: Container(
                            height: MediaQuery.of(context).size.height * 0.5,
                            child: SelectCity(),
                          ),
                          actions: [
                            RaisedButton(
                              child: Text("Continue"),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        );
                      },
                    );
                  },
                  child: Text(
                    "Amravati",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ),
                SizedBox(
                  width: 100,
                ),
                InkWell(
                  child: Icon(
                    Icons.notifications,
                    size: 28,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotificationPage(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  width: 20,
                ),
                InkWell(
                  child: Icon(
                    Icons.shopping_cart,
                    size: 28,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyCart(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: GestureDetector(
                child: AvatarGlow(
                  endRadius: 60,
                  glowColor: Colors.white,
                  child: Material(
                    elevation: 8,
                    shape: CircleBorder(),
                    child: CircleAvatar(
                      radius: 25,
                      child: Icon(Icons.person),
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
              ),
              decoration: BoxDecoration(color: Colors.lightBlueAccent),
              accountName: Text("Anurag Shrirao"),
              // Text("${authProvider.userModel?.name ?? "username lading..."}"),
              accountEmail: Text("anuragshrirao@gmail.com"),
              // Text("${authProvider.user.email}"),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              child: ListTile(
                title: Text("Home Page"),
                leading: Icon(Icons.home, color: Colors.blue),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyCart(),
                  ),
                );
              },
              child: ListTile(
                title: Text("My Card"),
                leading: Icon(
                  Icons.shopping_cart,
                  color: Colors.blue,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Booking(),
                  ),
                );
              },
              child: ListTile(
                title: Text("My Orders"),
                leading: Icon(Icons.assignment_turned_in, color: Colors.blue),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Profile(),
                  ),
                );
              },
              child: ListTile(
                title: Text("My Profile"),
                leading: Icon(Icons.person, color: Colors.blue),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => NotificationPage(),
                  ),
                );
              },
              child: ListTile(
                title: Text("Notification"),
                leading: Icon(Icons.notifications, color: Colors.blue),
              ),
            ),
            ListTile(
              title: Text("Dark Theme"),
              leading: Icon(Icons.brightness_5, color: Colors.blue),
              trailing: IconButton(
                onPressed: () {
                  // ThemeProvider themeProvider =
                  // Provider.of<ThemeProvider>(context, listen: false);
                  // themeProvider.swapTheme();
                },
                icon: Icon(
                  Icons.brightness_6,
                ),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Help(),
                  ),
                );
              },
              child: ListTile(
                title: Text("Help"),
                leading: Icon(
                  Icons.phone,
                  color: Colors.blue,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Abount"),
                leading: Icon(
                  Icons.help,
                  color: Colors.blue,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                // Provider.of<AuthProvider>(context, listen: false)
                //     .signOut();
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => ScreenController(),
                //   ),
                // );
              },
              child: ListTile(
                title: Text("Log Out"),
                leading: Icon(
                  Icons.lock,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              border: Border.all(color: Colors.blue),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.search),
                    ),
                    Flexible(
                      flex: 3,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Search Service",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(onTap: () {}, child: Icon(Icons.mic)),
                    ),
                  ],
                ),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.28,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(56),
              ),
              child: Carousel(
                borderRadius: true,
                radius: Radius.circular(15),
                boxFit: BoxFit.fill,
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
                overlayShadow: true,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: Container(
              // height: 500,
              // height: MediaQuery.of(context).size.height*0.4,
              child: Card(
                elevation: 2,
                color: Colors.white,
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      height: 60,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Carousel(
                          borderRadius: true,
                          // radius: Radius.circular(7),
                          boxFit: BoxFit.fill,
                          images: [
                            // AssetImage("image/etroplus3.jpeg",),
                            // AssetImage("image/etroplus3.jpeg"),
                            // AssetImage("image/etroplus3.jpeg"),
                            // AssetImage("image/etroplus3.jpeg"),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.pinkAccent,
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                            Container(
                                decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(7),
                            )),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.greenAccent,
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                            Container(
                                decoration: BoxDecoration(
                              color: Colors.limeAccent,
                              borderRadius: BorderRadius.circular(7),
                            )),
                          ],
                          autoplay: true,
                          dotBgColor: Colors.transparent,
                          animationCurve: Curves.fastOutSlowIn,
                          animationDuration: Duration(milliseconds: 2000),
                          // dotSize: 0.0,
                          showIndicator: false,
                          // dotColor: Colors.blue,
                          // indicatorBgPadding: 8.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      _boxContainer("Electrician", Icon(Icons.account_circle)),
                      _boxContainer("Plumber", Icon(Icons.anchor)),
                      _boxContainer("Carpenter", Icon(Icons.weekend_outlined)),
                      _boxContainer("Beautician", Icon(Icons.account_circle)),
                    ],
                  ),
                  Row(
                    children: [
                      _boxContainer("Cakes and Bakery", Icon(Icons.forward)),
                      _boxContainer("Laundry", Icon(Icons.forward)),
                      _boxContainer("Painting", Icon(Icons.forward)),
                      _boxContainer("Furniture", Icon(Icons.forward)),
                    ],
                  ),
                  Row(
                    children: [
                      _boxContainer("Home Cleaning", Icon(Icons.forward)),
                      _boxContainer("Car Washing", Icon(Icons.forward)),
                      _boxContainer("Event Management", Icon(Icons.forward)),
                      _boxContainer("Fire exinguisher", Icon(Icons.forward)),
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
            onTap: ServiceList(
              categoryName: "Beauty Services",
            ),
            serviceName2: "Hair Spa",
          ),
          ServiceContainer(
            serviceCategory: "Cake Service",
            serviceName1: "Black Forest Cake",
            serviceName2: "Choco Vanilla Cake",
            color: Colors.purpleAccent,
            onTap: ServiceList(
              categoryName: "Cakes and Bakery Product",
            ),
          ),
          ServiceContainer(
            serviceCategory: "Electric Service",
            serviceName1: "Fan Installation",
            serviceName2: "Inverter Installation",
            color: Colors.cyanAccent,
            onTap: ServiceList(
              categoryName: "Electric Services",
            ),
          ),
          ServiceContainer(
            serviceCategory: "Plumber Service",
            serviceName1: "Refrigerator Installation",
            serviceName2: "AC Repair",
            color: Colors.orangeAccent,
            onTap: ServiceList(
              categoryName: "Plumber Service",
            ),
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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
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
              child: Text(
                "View All Services",
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              color: Colors.lightBlueAccent,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

_boxContainer(String categoryName, Icon categoryIcon) {
  return Expanded(
    flex: 1,
    child: Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        border: Border.all(
          color: Colors.black12,
        ),
      ),
      child: RaisedButton(
          color: Colors.white,
          splashColor: Colors.black,
          onPressed: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.account_circle),
              Text(
                categoryName,
                // softWrap: false,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
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
              height: MediaQuery.of(context).size.height * 0.20,
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
