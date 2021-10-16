import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';
// ignore: unused_import

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Container(
            height: 50, width: 150, child: Image.asset("assets/logo3.png")),
      ),
      // ignore: sized_box_for_whitespace
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ignore: prefer_const_constructors
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Icon(Icons.contact_mail_outlined),
                  Text(
                    "  Contact Us",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "SourceSansPro",
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              // ignore: avoid_unnecessary_containers
              Container(child: Image.asset("assets/contactus.jpg")),
              // ignore: avoid_unnecessary_containers
              Container(
                // ignore: prefer_const_constructors
                padding: EdgeInsets.all(20),
                // ignore: prefer_const_constructors
                child: Text(
                  "Address:",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "SourceSansPro",
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                child: Text(
                  "Amity Innovation Incubator,\n B Block, Amity University Campus, \nSector 125, Noida, Uttar Pradesh 201313",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "SourceSansPro",
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  "In case of any issues or queries mail us at ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "SourceSansPro",
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                child: Linkify(
                  text: "contact@doodlebook.in",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "SourceSansPro",
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                  onOpen: _onOpen,
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onOpen(LinkableElement link) async {
    if (await canLaunch(link.url)) {
      await launch(link.url);
    } else {
      throw ("cannot open link $link");
    }
  }
}
