import 'package:app/customappbar.dart';
import 'package:app/navbar.dart';
import 'package:app/pallate.dart';
import 'package:flutter/material.dart';

class saved extends StatefulWidget {
  @override
  _savedState createState() => _savedState();
}

class _savedState extends State<saved> {
  @override
  bool theme(BuildContext ctx) {
    if (MediaQuery.of(ctx).platformBrightness == Brightness.dark) {
      return true;
    } else {
      return false;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: navbar(isDark: theme(context)),
      appBar: CustomAppBar(
        preferredSize: Size(getWidth(context), appBarPreferredSizeHeight),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.bookmark, color: Color(0xff757575)),
            SizedBox(
              width: 10,
            ),
            Text(
              "Saved",
              style: TextStyle(fontSize: 22, color: Color(0xff757575)),
            ),
          ],
        ),
      ),
    );
  }
}
