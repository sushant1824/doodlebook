import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

class otpPage extends StatefulWidget {
  final String originalOtp;
  final String userName;
  final String email;
  const otpPage(
      {Key? key,
      required this.originalOtp,
      required this.userName,
      required this.email})
      : super(key: key);
  @override
  _otpPageState createState() => _otpPageState();
}

class _otpPageState extends State<otpPage> {
  TextEditingController otpcontroller = TextEditingController();
  var otp;
  final _otpformKey = GlobalKey<FormState>();
  var smsCode = "";
  int t = 60;
  late Timer _timer;
  bool _isloading = false;
  @override
  void initState() {
    timer();
    super.initState();
  }

//timer function to start timer of 60 seconds
  void timer() async {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (t == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            t--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Future<void> signupfun() async {
    var response = await http.get(
        Uri.parse("https://doodlebook.in/api/emailverification"),
        headers: {
          "username": widget.userName,
          "email": widget.email,
        });
    Map<String, dynamic> res = jsonDecode(response.body);
    print(res);
    if (res["success"] == 1) {
      print("object");
      setState(() {
        t = 60;
        timer();
      });
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

  @override
  Widget build(BuildContext context) {
    otp = widget.originalOtp;
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Container(
            height: 50, width: 150, child: Image.asset("assets/logo3.png")),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 300),
            Container(
              child: Text("Enter OTP"),
            ),
            SizedBox(
              height: 10,
            ),
            Form(
                key: _otpformKey,
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        width: 300,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter OTP',
                          ),
                          controller: otpcontroller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter OTP";
                            } else if (value.compareTo(widget.originalOtp) ==
                                0) {
                              return "Please enter Coreect OTP";
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20)),
                        child: TextButton(
                          child: Text(
                            t <= 0 ? "Resend" : "OK",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            if (_otpformKey.currentState!.validate()) {
                              if (t <= 0) {
                              } else {
                                Navigator.of(context).pop(true);
                              }
                            }
                          },
                        ),
                      ),
                      t <= 0 ? Container() : Text(t.toString()),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
