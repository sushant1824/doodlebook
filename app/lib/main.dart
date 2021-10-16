import 'dart:async';
import 'package:app/PrivacyPolicy.dart';
import 'package:app/aboutus.dart';
import 'package:app/contactus.dart';
import 'package:app/forgot-password.dart';
import 'package:app/login.dart';
import 'package:app/signup.dart';
import 'package:app/start.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MySplashScreen(title: 'Flutter Demo Home Page'),
    );
  }
}

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MySplashScreen> createState() => _MySplashScreen();
}

class _MySplashScreen extends State<MySplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 1, milliseconds: 500),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => start())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 150,
                width: 150,
                child: Image.asset("assets/dlogo2.png")),
            SizedBox(
              height: 100,
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
