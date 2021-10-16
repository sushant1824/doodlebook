import 'dart:convert';

import 'package:app/contactus.dart';
import 'package:app/forgot-password.dart';
import 'package:app/homepage.dart';
import 'package:app/signup.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  get input => null;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<void> loginfun() async {
      var response =
          await http.post(Uri.parse("https://doodlebook.in/api/login"), body: {
        "username": emailcontroller.text,
        "password": passwordcontroller.text,
      });
      Map<String, dynamic> res = jsonDecode(response.body);
      print(res);
      if (res["message"].toString().compareTo(
              "Profile Not Found.Please Check Entered Username or Password!") ==
          0) {
        _scaffoldkey.currentState!.showSnackBar(const SnackBar(
            content: Text(
                "Profile Not Found.Please Check Entered Username or Password!")));
      } else if (res["message"].toString().compareTo("Error") == 0) {
        _scaffoldkey.currentState!.showSnackBar(const SnackBar(
            content: Text(
                "Profile Not Found.Please Check Entered Username or Password!")));
      } else {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("username", emailcontroller.text);
        Navigator.push(context, MaterialPageRoute(builder: (_) => homepage()));
      }
    }

    return Scaffold(
      key: _scaffoldkey,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 350,
              child: Image(
                image: AssetImage("assets/login.png"),
                fit: BoxFit.contain,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Login",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              alignment: Alignment.centerLeft,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Form(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                            hintText: 'Enter mail id'),
                        // autovalidate: true,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (val) {
                          if (val!.isEmpty)
                            return "Enter valid mail id as abc@gmail.com";
                          else if (!val.contains("@") || !val.contains("."))
                            return "Enter valid mail id as abc@gmail.com";
                        },
                        controller: emailcontroller,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            hintText: 'Enter your secure password'),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (val) {
                          if (val!.isEmpty)
                            return "Enter valid Password";
                          else if (val.length < 6)
                            return "Minimum Length of Password should be of 6 characters";
                        },
                        controller: passwordcontroller,
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => forgotpassword()));
                      },
                      child: Text(
                        'Forgot Password ?',
                        style: TextStyle(color: Colors.blue, fontSize: 15),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20)),
                      child: FlatButton(
                        onPressed: () {
                          loginfun();
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => signup()));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: Text(
                          "New User? Create Account",
                          style: TextStyle(color: Colors.black),
                        ),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 0.5, color: Colors.black))),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
