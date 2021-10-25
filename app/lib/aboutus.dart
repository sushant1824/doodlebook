// ignore_for_file: prefer_const_constructors

import 'package:app/monetizationPolicy.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: use_key_in_widget_constructors
class AboutUs extends StatelessWidget {
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
                  Icon(Icons.message_outlined),
                  Text(
                    "  About Us",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "SourceSansPro",
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ],
              ),
              // ignore: avoid_unnecessary_containers
              Container(child: Image.asset("assets/aboutus.jpg")),
              // ignore: avoid_unnecessary_containers
              Container(
                // ignore: prefer_const_constructors
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                // ignore: prefer_const_constructors
                child: Text(
                  "Doodlebook is an entertainment and information driven community of content creators of various domains where they can showcase their talent ,hobbies via creating their own pages and monetize their pages to generate income after qualifying all the thresholds handled by Doodlebook itself. Doodlebook reserves 50% of its profit earned through promotions of its partnered brands to distribute among content content creators.However, the percentage may vary in future depending upon circumstances but to know more about earnings you can go on earnings tab in your profile. Content creators can upload content in any genre in the form of images and videos to entertain their audience.All the content creators should comply with all",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "SourceSansPro",
                    fontWeight: FontWeight.w300,
                    color: Color(0xFF525252),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => monetizationPolicy()));
                },
                child: Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    "the terms and conditions to apply for monetization.",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "SourceSansPro",
                      fontWeight: FontWeight.w300,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Text(
                  "As users, you can enjoy customized creative feed of your favourite content creators. Dive into the exciting world of Doodlebook and we promise you’ll never have a dull moment ever!",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "SourceSansPro",
                    fontWeight: FontWeight.w300,
                    color: Color(0xFF525252),
                  ),
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
}
