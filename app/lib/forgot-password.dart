import 'package:app/homepage.dart';
import 'package:app/login.dart';
import 'package:app/signup.dart';
import 'package:flutter/material.dart';

class forgotpassword extends StatefulWidget {
  @override
  _forgotpasswordState createState() => _forgotpasswordState();
}

class _forgotpasswordState extends State<forgotpassword> {
  @override
  Widget build(BuildContext context) {
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
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'User Name',
                            hintText: 'Enter valid mail id as abc@gmail.com'),
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
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => homepage()));
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
