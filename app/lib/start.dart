import 'dart:developer';

import 'package:app/PrivacyPolicy.dart';
import 'package:app/aboutus.dart';
import 'package:app/contactus.dart';
import 'package:app/login.dart';
import 'package:app/pallate.dart';
import 'package:app/signup.dart';
import 'package:app/terms_condition.dart';
import 'package:app/welcome_screen.dart';
import 'package:flutter/material.dart';

final _lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TextTheme(bodyText1: TextStyle(color: Colors.black)));
final _darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white)));

class start extends StatefulWidget {
  @override
  _startState createState() => _startState();
}

class _startState extends State<start> {
  bool _switchValue = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _switchValue ? _lightTheme : _darkTheme,
      home: Scaffold(
        backgroundColor: _switchValue ? Colors.white : Colors.black,
        body: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 150,
              ),
              Switch(
                value: _switchValue,
                onChanged: (bool value) {
                  setState(() {
                    _switchValue = value;
                  });
                },
              ),
              Container(
                child: Image(
                  image: AssetImage("assets/WELCOME.jpg"),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              RichText(
                text: TextSpan(
                  text: 'Welcome to Doodlebook',
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => login()));
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    color: Colors.orange,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  RaisedButton(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => signup()));
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    color: Colors.orange,
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => termsAndConditions()));
                    },
                    child: Container(
                      child: Text(
                        "Terms & Conditions",
                        style: kLinks,
                      ),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 0.7, color: Colors.black))),
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Policy()));
                    },
                    child: Container(
                      child: Text(
                        "Privacy Policy",
                        style: kLinks,
                      ),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 0.7, color: Colors.black))),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => AboutUs()));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 50),
                      child: Text(
                        "About Us",
                        style: kLinks,
                      ),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 0.7, color: Colors.black))),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => ContactUs()));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 40),
                      child: Text(
                        "Contact Us",
                        style: kLinks,
                      ),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 0.7, color: Colors.black))),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
