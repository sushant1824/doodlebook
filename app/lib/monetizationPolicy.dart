import 'package:app/terms_condition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class monetizationPolicy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Container(
            height: 50, width: 150, child: Image.asset("assets/logo3.png")),
      ),
      // ignore: sized_box_for_whitespace
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ignore: prefer_const_constructors
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Icon(Icons.monetization_on),
                  Text(
                    "  Monetization Policy",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "SourceSansPro",
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(top: 10.0, left: 10),
                child: Linkify(
                  text:
                      "By opting Doodlebook monetization scheme you are agreeing to be bound by the following terms and conditions of this policy.",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "SourceSansPro",
                    fontWeight: FontWeight.w300,
                    color: Color(0xFF525252),
                  ),
                  onOpen: _onOpen,
                ),
              ),
              new Container(
                height: 1.5,
                color: Color(0xFF525252),
                width: 380,
              ),
              Container(
                padding: EdgeInsets.only(top: 10.0, left: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Policy Terms",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "SourceSansPro",
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: 10.0,
                  left: 10.0,
                ),
                alignment: Alignment.centerLeft,
                child: Text(
                  "• To get your account monetized you need to meet minimum conditions for monetization, i.e. 300 Followers, 50 Profile Likes, 20 Posts complying With",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "SourceSansPro",
                    fontWeight: FontWeight.w300,
                    color: Color(0xFF525252),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => termsAndConditions()));
                },
                child: Container(
                  padding: EdgeInsets.only(
                    left: 10.0,
                  ),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Basic Terms.",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "SourceSansPro",
                      fontWeight: FontWeight.w300,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  "\n\n• Monetization of the account will be ineligible for approval on stealing copyrighted content of other people.\n\n• Taking someone else’s content, making minimal changes, and presenting it as your original work would be a violation of this policy. This clause applies even if you have permission from the original creator.\n\n More examples of content ineligible for monetization in Doodlebook:\n\n• Clips of moments from your favourite show edited together with little or no narrative of own.\n\n• Uploading a compilation of videos or a truncated version of videos already uploaded on other websites.\n\n• Collection of songs from different artists (even if you have their permission)\n\n• Content uploaded many times by other creators.\n\n• If after monetization, your account or content gets reported by users, Doodlebook will look into the matter seriously and, if required, it may terminate the account without any prior consent of the account holder.\n\n•If after monetization, you fail to create any content for a month, your earnings of that month will be nil.\n\n•Despite meeting all the requirements, Doodlebook may not permit monetization if it finds a violation of any of the basic terms and will not be liable to justify for the same. Doodlebook reserves the right to demonetize account anytime without any prior consent to the account holder.\n\n•You must not use any offensive means to gain the minimum criteria; if any of such activity comes to the notice of Doodlebook, it may lead to termination of your account.\n\n•Doodlebook monetization program is available in India only. Content creator in any country except India cannot participate in this program.\n\n•Doodlebook does not make any promise for any specific amount of income you can generate through monetization program. Your success will highly depend upon the reach and quality of your content.\n\n•You trust on Doodlebook monetization algorithm and agree upon the earnings and score generated by it in your account.\n\n•You are responsible for the correct submission of bank details asked during the monetization procedure. If any mishappening (like wrong input of bank credentials etc.) occurs while giving your details, Doodlebook is not responsible in that circumstance.\n\n•Doodlebook will not be liable if any mishappening occurs through third-party payment processors (banks).\n\n•We don’t allow egregious behaviour that has a large negative impact on the community. This policy means you should be respectful of your viewers, your fellow creators, and our advertisers -- both on and off Doodlebook.\n\n•Doodlebook reserves the right to modify monetization policies,money making and distribution model but after doing so it will notify all the content creators to go through them and continue to use our services if they agree on modifications.",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "SourceSansPro",
                    fontWeight: FontWeight.w300,
                    color: Color(0xFF525252),
                  ),
                ),
              ),
              new Container(
                height: 1,
                color: Color(0xFF525252),
                width: 380,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onOpen(LinkableElement link) async {
    if (await canLaunch(link.url)) {
      await launch(link.url);
    } else {
      throw ("cannot open link $link");
    }
  }
}
