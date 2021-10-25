import 'package:flutter/material.dart';

Widget followButton({required Function onPressed}) {
  return Container(
    padding: EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 5),
    decoration: BoxDecoration(
        color: Colors.blue, borderRadius: BorderRadius.circular(4)),
    child: Text(
      "Follow",
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  );
}
