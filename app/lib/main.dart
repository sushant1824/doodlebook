import 'dart:async';
import 'package:app/PrivacyPolicy.dart';
import 'package:app/aboutus.dart';
import 'package:app/contactus.dart';
import 'package:app/forgot-password.dart';
import 'package:app/homepage.dart';
import 'package:app/login.dart';
import 'package:app/signup.dart';
import 'package:app/start.dart';
import 'package:app/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.white70,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      // textTheme: TextTheme(headline: TextStyle(color: Colors.white)),
      color: Colors.black,
      iconTheme: IconThemeData(color: Colors.white),
      elevation: 10,
    ),
  );
  final lightTheme = ThemeData.light().copyWith(
    primaryColor: Color(0xFF0074A8),
    scaffoldBackgroundColor: Color(0xFFFFFFFF),
    appBarTheme: AppBarTheme(
      color: Colors.grey.shade100,
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 10,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const MySplashScreen(
        title: 'Flutter Demo Home Page',
      ),
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
  bool theme(BuildContext ctx) {
    if (MediaQuery.of(ctx).platformBrightness == Brightness.dark) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1, milliseconds: 500), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var result = prefs.getString("username");
      if (result.toString().isEmpty) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => start()));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => homepage(isDark: theme(context))));
      }
    });
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
