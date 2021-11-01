import 'dart:convert';

import 'package:app/homepage.dart';
import 'package:app/saved.dart';
import 'package:app/share.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';
import 'package:http/http.dart' as http;

final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

class navbar extends StatelessWidget {
  late bool dark = false;
  final bool isDark;
  navbar({required this.isDark});

  @override
  Widget build(BuildContext context) {
    print("dark22+++++++");

    print(dark);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Sushant"),
            accountEmail: Text("ssahu242001@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  "assets/person.png",
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/background.jpg"),
                  fit: BoxFit.cover),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("My Profile"),
          ),
          ListTile(
            leading: Icon(Icons.emoji_nature_outlined),
            title: Text("My Following"),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.save),
            title: Text("Saved"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => saved()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.attach_money_rounded),
            title: Text("Earnings"),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.feedback_outlined),
            title: Text("Feedback"),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.info_outlined),
            title: Text("About Us"),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.admin_panel_settings_sharp),
            title: Text("T&C"),
            onTap: () => null,
          ),
          ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.clear();
                Navigator.of(context).pushReplacement(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        login(),
                  ),
                );
              }),
          SwitchListTile(
              title: Text('Dark mode'),
              value: isDark,
              onChanged: (bool value) {
                print("value+++++++");
                print(value);
                // setState(() {
                dark = value;
                print("dark22+++++++");
                print(dark);
                // }
                // );
              }),
        ],
      ),
    );
  }
}
