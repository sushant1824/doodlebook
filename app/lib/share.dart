import 'dart:convert';

import 'package:app/customappbar.dart';
import 'package:app/navbar.dart';
import 'package:app/pallate.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:flutter_social_content_share/flutter_social_content_share.dart';

final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

class share extends StatefulWidget {
  @override
  _shareState createState() => _shareState();
}

class _shareState extends State<share> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    var response = await http.get(
      Uri.parse("https://doodlebook.in/api/share?id=(post_id)"),
    );
    Map<String, dynamic> res = jsonDecode(response.body);
    print(res);
  }

  /// SHARE ON FACEBOOK CALL
  shareOnFacebook() async {
    String? result = await FlutterSocialContentShare.share(
        type: ShareType.facebookWithoutImage,
        url: "https://www.facebook.com",
        quote: "captions");
    print(result);
  }

  shareWatsapp() async {
    String? result = await FlutterSocialContentShare.shareOnWhatsapp(
        "9752320206", "Sushant");
    print(result);
  }

  /// SHARE ON INSTAGRAM CALL
  shareOnInstagram() async {
    String? result = await FlutterSocialContentShare.share(
        type: ShareType.instagramWithImageUrl,
        imageUrl:
            "https://post.healthline.com/wp-content/uploads/2020/09/healthy-eating-ingredients-732x549-thumbnail-732x549.jpg");
    print(result);
  }

  /// SHARE ON EMAIL CALL
  shareEmail() async {
    String? result = await FlutterSocialContentShare.shareOnEmail(
        recipients: ["xxxx.xxx@gmail.com"],
        subject: "Subject appears here",
        body: "Body appears here",
        isHTML: true); //default isHTML: False
    print(result);
  }

  /// SHARE ON SMS CALL
  shareSMS() async {
    String? result = await FlutterSocialContentShare.shareOnSMS(
        recipients: ["xxxxxx"], text: "Text appears here");
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: navbar(),
        appBar: CustomAppBar(
          preferredSize: Size(getWidth(context), appBarPreferredSizeHeight),
        ),
        body: Column(
          children: <Widget>[
            Text('Share on :'),
            Row(
              children: [
                Icon(Icons.facebook),
                TextButton(
                  child: Text("facebook"),
                  onPressed: () {
                    shareOnFacebook();
                  },
                ),
              ],
            ),
            TextButton(
              child: Text("instagram"),
              onPressed: () {
                shareOnInstagram();
              },
            ),
            TextButton(
              child: Text("whatsapp"),
              onPressed: () {
                shareWatsapp();
              },
            ),
            TextButton(
              child: Text("email"),
              onPressed: () {
                shareEmail();
              },
            ),
            TextButton(
              child: Text("Copy Link"),
              onPressed: () {
                shareSMS();
              },
            ),
          ],
        ),
      ),
    );
  }
}
