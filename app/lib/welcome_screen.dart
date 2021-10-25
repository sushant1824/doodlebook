import 'package:app/homepage.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class welcome_screen extends StatelessWidget {
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        image: Image.asset("assets/WELCOME.jpg"),
        title: "welcome to DoodleBook",
        body: "ewu rfe glruitrg fhuer",
        footer: Text("@Doodlebook company"),
      ),
      PageViewModel(
        image: Image.asset("assets/contactus.jpg"),
        title: "welcome to DoodleBook",
        body: "ewu rfe glruitrg fhuer",
        footer: Text("@Doodlebook company"),
      ),
      PageViewModel(
        image: Image.asset("assets/password.png"),
        title: "welcome to DoodleBook",
        body: "ewu rfe glruitrg fhuer",
        footer: Text("@Doodlebook company"),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: IntroductionScreen(
            done: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => homepage()));
              },
              child: Text(
                "Done",
                style: TextStyle(color: Colors.black),
              ),
            ),
            onDone: () {},
            pages: getPages(),
            globalBackgroundColor: Colors.white,
          ),
        ));
  }
}
