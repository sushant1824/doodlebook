import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

class SearchAppBar extends StatefulWidget {
  @override
  _SearchAppBarState createState() => new _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  TextEditingController searchController = TextEditingController();
  Widget appBarTitle = new Text("Doodlebook");
  Icon actionIcon = new Icon(Icons.search);

  List<String> listarray = [];
  @override
  Widget build(BuildContext context) {
    Future<void> searchfun() async {
      var response = await http.get(
        Uri.parse(
            "https://doodlebook.in/api/search?q=${searchController.text}"),
      );
      Map<String, dynamic> res = jsonDecode(response.body);
      print(res);
      if (res["message"].toString().compareTo("Empty") == 0) {
        _scaffoldkey.currentState!
            .showSnackBar(const SnackBar(content: Text("nothing got found:")));
      } else if (res["message"].toString().compareTo("Error") == 0) {
        _scaffoldkey.currentState!
            .showSnackBar(const SnackBar(content: Text("Error")));
      } else {
        listarray = res["categories"];
        listarray.addAll(res["profiles"]);
        _scaffoldkey.currentState!
            .showSnackBar(const SnackBar(content: Text("Your Search Found")));
      }
      print(response.headers);
    }

    return new Scaffold(
      appBar:
          new AppBar(centerTitle: true, title: appBarTitle, actions: <Widget>[
        new IconButton(
          icon: actionIcon,
          onPressed: () {
            setState(() {
              if (this.actionIcon.icon == Icons.search) {
                this.actionIcon = new Icon(Icons.close);
                this.appBarTitle = new TextField(
                  onChanged: (String val) {
                    searchfun();
                  },
                  controller: searchController,
                  style: new TextStyle(
                    color: Colors.white,
                  ),
                  decoration: new InputDecoration(
                      prefixIcon: new Icon(Icons.search, color: Colors.white),
                      hintText: "Search...",
                      hintStyle: new TextStyle(color: Colors.white)),
                );
              } else {
                this.actionIcon = new Icon(Icons.search);
                this.appBarTitle = new Text("Doodlebook");
              }
            });
          },
        ),
      ]),
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Text(
              "Go ahead and search something...",
              style: TextStyle(fontSize: 18, color: Color(0xff757575)),
            )
          ],
        ),
      ),
    );
  }
}
