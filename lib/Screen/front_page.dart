import 'package:flutter/material.dart';
import 'package:newflutter_android/Screen/service_list.dart';

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
                  onTap: () {},
                ),
                InkWell(
                  child: Icon(
                    Icons.shopping_cart,
                    size: 28,
                  ),
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.06,
              color: Colors.white,
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
                  borderRadius: BorderRadius.circular(15),
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      "https://firebasestorage.googleapis.com/v0/b/shopapp-354c8.appspot.com/o/all%2F5.jpg?alt=media&token=a4e6200a-2aa8-480e-8c49-7df4db709744",
                    ),
                  )),
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
                      child: Center(
                          child: Text(
                            "Offer Slides",
                            style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        shape: BoxShape.rectangle,
                        color: Colors.cyanAccent,
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
              child: Text("View All Services",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
              color: Colors.cyan,
            ),
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
              Text(
                "Electrician",
                style: TextStyle(fontSize: 13),
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
                color: color,
              ),
            ),
            Center(
                child: Text(
                  serviceName,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
    ),
  );
}
