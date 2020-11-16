import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Help extends StatelessWidget {
  final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'helpetroplus@gmail.com',
      queryParameters: {'subject': 'Customer Query About ETROPLUS'});

  @override
  Widget build(BuildContext context) {
    const url = "http://www.etroplus.com/";
    const whatsappurl = "https://wa.me/919423985196";
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.09,
        title: Text(
          "Help",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Contact Us",
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FlatButton(
              color: Colors.yellow,
              onPressed: () {
                launch("tel://9423985196");
              },
              child: Text(
                "Call Us - 9423985196 ",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              )),
          SizedBox(
            height: 10,
          ),
          FlatButton(
            color: Colors.greenAccent,
            onPressed: () async {
              if (await canLaunch(whatsappurl)) {
                await launch(whatsappurl);
              } else {
                throw 'Could not message try after some time';
              }
            },
            child: Text(
              "WhatsApp US",
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FlatButton(
              color: Colors.blue,
              onPressed: () async {
                if (await canLaunch(_emailLaunchUri.toString())) {
                  await launch(_emailLaunchUri.toString());
                } else {
                  throw 'Could not email try after some time';
                }
              },
              child: Text(
                "E-mail - helpetroplus@gmail.com",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              )),
          SizedBox(
            height: 10,
          ),
          FlatButton(
            color: Colors.pinkAccent,
            onPressed: () async {
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not open website try after some time';
              }
            },
            child: Text(
              "Visit Our website",
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "FAQ AND QUERIES",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "TERMS AND CONDITIONS",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
