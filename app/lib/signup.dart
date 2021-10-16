import 'dart:convert';
import 'dart:developer';

import 'package:app/contactus.dart';
import 'package:app/custom-page-route.dart';
import 'package:app/homepage.dart';
import 'package:app/login.dart';
import 'package:app/otp.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

class signup extends StatefulWidget {
  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  get input => Null;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController gendercontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    Future<void> createUser() async {
      var response =
          await http.post(Uri.parse("https://doodlebook.in/api/signup"), body: {
        "username": usernamecontroller.text,
        "password": passwordcontroller.text,
        "email": emailcontroller.text,
        "gender": gendercontroller.text,
        "age": agecontroller.text,
      });
      Map<String, dynamic> res = jsonDecode(response.body);
      print(res);
      if (res["message"].toString().compareTo("Signup Done") == 0) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("username", emailcontroller.text);
        print("signup successful");
        Navigator.push(context, MaterialPageRoute(builder: (_) => homepage()));
      } else if (res["message"]
              .toString()
              .compareTo("Username Already Exists!") ==
          0) {
        _scaffoldkey.currentState!.showSnackBar(const SnackBar(
            content: Text(
                "Profile Not Found.Please Check Entered Username or Password!")));
      } else {
        _scaffoldkey.currentState!
            .showSnackBar(const SnackBar(content: Text("Error")));
      }
    }

    showAlertDialog(BuildContext context, String originalOtp) {
      // set up the button
      final _otpformKey = GlobalKey<FormState>();
      Widget okButton = TextButton(
        child: Text("OK"),
        onPressed: () {
          if (_otpformKey.currentState!.validate()) {
            print("Success");
          }
        },
      );

      // set up the AlertDialog
      TextEditingController otpcontroller = TextEditingController();
      AlertDialog alert = AlertDialog(
        title: Text("Enter OTP"),
        content: Form(
            key: _otpformKey,
            child: TextFormField(
              controller: otpcontroller,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter OTP";
                } else if (value.compareTo(originalOtp) == 0) {
                  return "Please enter Coreect OTP";
                }
              },
            )),
        actions: [
          okButton,
        ],
      );
      // show the dialog
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    Future<void> signupfun() async {
      var response = await http.get(
          Uri.parse("https://doodlebook.in/api/emailverification"),
          headers: {
            "username": usernamecontroller.text,
            "email": emailcontroller.text,
          });
      Map<String, dynamic> res = jsonDecode(response.body);
      print(res);
      if (res["success"] == 1) {
        print("object");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                otpPage(originalOtp: res["code"].toString())));
      } else if (res["message"] ==
          "Profile with this username or email already exists!") {
        _scaffoldkey.currentState!.showSnackBar(const SnackBar(
            content:
                Text("Profile with this username or email already exists!")));
      } else {
        // SharedPreferences prefs = await SharedPreferences.getInstance();
        // prefs.setString("username", emailcontroller.text);
        // Navigator.push(context, MaterialPageRoute(builder: (_) => homepage()));
        // _scaffoldkey.currentState!
        //     .showSnackBar(const SnackBar(content: Text("Error")));
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 250,
              child: Image(
                image: AssetImage("assets/signup.jpg"),
                fit: BoxFit.contain,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Sign Up",
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
                            labelText: 'Email ID',
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
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'User Name',
                            hintText: 'Enter valid username'),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (val) {
                          if (val!.isEmpty) return "Enter valid username";
                        },
                        controller: usernamecontroller,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        obscureText: !isVisible,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: isVisible
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off),
                              color: Theme.of(context).primaryColorDark,
                              onPressed: () {
                                setState(() {
                                  isVisible = !isVisible;
                                });
                              },
                            ),
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            hintText: 'Enter your secure password'),
                        validator: (val) {
                          if (val!.isEmpty)
                            return "Enter valid Password";
                          else if (val.length < 6)
                            return "Minimum Length of Password should be of 6 characters";
                        },
                        controller: passwordcontroller,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Gender',
                            hintText: 'Enter Your Gender'),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (val) {
                          if (val!.isEmpty) return "Enter valid Gender";
                        },
                        controller: gendercontroller,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Age',
                            hintText: 'Enter Your Age'),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (val) {
                          if (val!.isEmpty) return "Enter valid Age";
                        },
                        controller: agecontroller,
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
                          signupfun();
                        },
                        child: Text(
                          'Sign Up',
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
                          "Already Have Account ? Login Here",
                          style: TextStyle(color: Colors.black),
                        ),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 0.5, color: Colors.black))),
                      ),
                    ),
                    SizedBox(
                      height: 10,
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
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          final tween = Tween(begin: begin, end: end);
          final curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: curve,
          );

          return SlideTransition(
            position: tween.animate(curvedAnimation),
            child: child,
          );
        });
  }
}
