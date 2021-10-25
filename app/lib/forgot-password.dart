import 'dart:convert';

import 'package:app/homepage.dart';
import 'package:app/login.dart';
import 'package:app/signup.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

class forgotpassword extends StatefulWidget {
  @override
  _forgotpasswordState createState() => _forgotpasswordState();
}

class _forgotpasswordState extends State<forgotpassword> {
  get input => null;
  TextEditingController emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<void> forgotpassfun() async {
      print("calling API");
      var response = await http
          .post(Uri.parse("https://doodlebook.in/api/forgotpassword"), body: {
        "email": emailcontroller.text,
      });
      print("sushn");
      Map<String, dynamic> res = jsonDecode(response.body);
      print(res);
      if (res["success"].toString().compareTo("success") == 0) {
        print("success");
        _scaffoldkey.currentState!
            .showSnackBar(const SnackBar(content: Text("Email Sent!")));
      } else if (res["status"].toString().compareTo("error") == 0) {
        _scaffoldkey.currentState!.showSnackBar(
            const SnackBar(content: Text("No profile have this email!")));
      } else {
        _scaffoldkey.currentState!
            .showSnackBar(const SnackBar(content: Text("Error")));
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            Container(
              height: 350,
              child: Image(
                image: AssetImage("assets/password.png"),
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Forgot Password",
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
                            labelText: 'User Name',
                            hintText: 'Enter valid mail id as abc@gmail.com'),
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
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20)),
                      child: FlatButton(
                        onPressed: () {
                          forgotpassfun();
                        },
                        child: Text(
                          'Send Mail',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(_createRoute());
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Already Have Account ? Click here",
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

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => login(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    );
  }
}
