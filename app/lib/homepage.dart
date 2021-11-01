import 'dart:convert';
import 'dart:ffi';
import 'package:app/buttons.dart';
import 'package:app/customappbar.dart';
import 'package:app/pallate.dart';
import 'package:app/share.dart';
import 'package:app/stories.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'navbar.dart';
import 'package:http/http.dart' as http;

class homepage extends StatefulWidget {
  final bool isDark;
  homepage({required this.isDark});

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  int pageIndex = 0;

  Future<void> gethomepage() async {
    var response = await http.get(
      Uri.parse("https://doodlebook.in/api/home"),
    );
    // Map<String, dynamic> res = jsonDecode(response.body);
    print(response.body);
  }

  //
  // Future gethomepage() async {
  //   final response = await http.get(
  //     Uri.parse("https://doodlebook.in/api/home"),
  //     //      headers: {
  //     //   HttpHeaders.authorizationHeader: jwtToken,
  //     // }
  //   );
  //   if (response.statusCode == 200) {
  //     // var data = ProfileModel.fromJson(json.decode(response.body)[0]);
  //     // print(data);
  //     // setState(() {
  //     //   _username = data.name;
  //     //   // _location = data.location;
  //     //   // image = data.image;
  //     //   // bio = data.Bio;
  //     //   print("++++++++++");
  //     //   print(_username);
  //     // });
  //     print("respose");
  //     print(response.body);
  //   } else {
  //     throw Exception('Failed to load');
  //   }
  // }

  @override
  void initState() {
    gethomepage();
    super.initState();
  }

  bool theme(BuildContext ctx) {
    if (MediaQuery.of(ctx).platformBrightness == Brightness.dark) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      drawer: navbar(isDark: theme(context)),
      appBar: CustomAppBar(
        preferredSize: Size(getWidth(context), appBarPreferredSizeHeight),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Pages You May Like !",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text("View More +"),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 190,
                child: Scrollbar(
                  child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffebf4fa),
                      ),
                      width: 100,
                      height: 170,
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          CircleAvatar(
                            backgroundImage: AssetImage("assets/person.png"),
                            radius: 40,
                          ),
                          Text(
                            "Satyam",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15.0),
                          ),
                          Text("1 Followers", style: TextStyle(fontSize: 11.0)),
                          SizedBox(
                            height: 5,
                          ),
                          followButton(
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 1,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => Container(
                  height: 40,
                  margin: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          new Container(
                            height: 40.0,
                            width: 40.0,
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage("assets/person.png")),
                            ),
                          ),
                          new SizedBox(
                            width: 10.0,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              new Text(
                                "Sushant",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              new Text(
                                "Oct 21 2021",
                                style: TextStyle(fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ],
                      ),
                      new IconButton(
                        icon: Icon(Icons.more_vert),
                        onPressed: null,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: ExpandableText(
                  "Probably the most requested feature after support for pro icons is the ability to retrieve an icon by their name. This was previously not possible, because a mapping from name to icon would break all discussed optimizations. Please bear in mind that this is still the case. As all icons could theoretically be requested,",
                  expandText: 'Show More',
                  collapseText: 'Show Less',
                  maxLines: 2,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset("assets/background.jpg"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "2 Likes",
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Text(
                      "0 Comments",
                      style: TextStyle(fontSize: 16.0),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 10),
                width: 390,
                height: 40,
                decoration: BoxDecoration(
                    color: Color(0xffe5e4e2),
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                      width: 30,
                    ),
                    new Icon(
                      Icons.thumb_up,
                      color: Color(0xff757575),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    new Icon(
                      Icons.comment,
                      color: Color(0xff757575),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    new Icon(
                      Icons.bookmark,
                      color: Color(0xff757575),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    new IconButton(
                      color: Color(0xff757575),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => share()),
                        );
                      },
                      icon: Icon(Icons.share),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getFooter() {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    List bottomItems = [
      pageIndex == 0 ? Icons.home_filled : Icons.home_outlined,
      pageIndex == 1 ? Icons.search : Icons.search_off_rounded,
      pageIndex == 2 ? Icons.file_upload_outlined : Icons.file_upload,
      pageIndex == 3
          ? Icons.video_collection_sharp
          : Icons.video_collection_outlined,
      pageIndex == 4 ? Icons.account_box : Icons.account_box_outlined,
    ];
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.symmetric(horizontal: BorderSide(color: Colors.grey)),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        GestureDetector(
          onTap: () {
            selectedTab(0);
          },
          child: Container(
            width: width / 5,
            child: Icon(
              pageIndex == 0 ? Icons.home_filled : Icons.home_outlined,
              color: pageIndex == 0 ? Colors.blue : Colors.grey,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            selectedTab(1);
          },
          child: Container(
            width: width / 5,
            child: Icon(
              pageIndex == 1 ? Icons.search : Icons.search_off_rounded,
              color: pageIndex == 1 ? Colors.blue : Colors.grey,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            selectedTab(2);
          },
          child: Container(
            width: width / 5,
            child: Icon(
              pageIndex == 2 ? Icons.file_upload_outlined : Icons.file_upload,
              color: pageIndex == 2 ? Colors.blue : Colors.grey,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            selectedTab(3);
          },
          child: Container(
            width: width / 5,
            child: Icon(
              pageIndex == 3
                  ? Icons.video_collection_sharp
                  : Icons.video_collection_outlined,
              color: pageIndex == 3 ? Colors.blue : Colors.grey,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            selectedTab(4);
          },
          child: Container(
            width: width / 5,
            child: Icon(
              pageIndex == 4 ? Icons.account_box : Icons.account_box_outlined,
              color: pageIndex == 4 ? Colors.blue : Colors.grey,
            ),
          ),
        ),
      ]),
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
