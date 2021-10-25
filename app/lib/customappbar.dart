import 'package:app/searchAppBar.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  // final String leadingImage;
  CustomAppBar({
    required this.preferredSize,
  });
  @override
  final Size preferredSize;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
            ),
            Text(
              "Doodlebook",
              style: TextStyle(
                  fontFamily: "SourceSansPro-Regular",
                  fontSize: 24,
                  color: Colors.white),
            ),
            Row(
              children: [
                IconButton(
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SearchAppBar()),
                    );
                  },
                  icon: Icon(Icons.search),
                ),
                IconButton(
                  color: Colors.white,
                  onPressed: () {},
                  icon: Icon(Icons.notifications),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
