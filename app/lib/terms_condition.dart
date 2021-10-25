import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class termsAndConditions extends StatelessWidget {
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
                  Icon(Icons.admin_panel_settings_sharp),
                  Text(
                    "  Terms and Conditions",
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
              // ignore: avoid_unnecessary_containers
              Container(child: Image.asset("assets/tandc.jpg")),
              // ignore: avoid_unnecessary_containers
              Container(
                padding: EdgeInsets.only(top: 10.0, left: 10),
                child: Linkify(
                  text:
                      "By using the Doodlebook.com website and Doodlebook service you are agreeing to be bound by the following terms and conditions.",
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
                  "Basic Terms",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "SourceSansPro",
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10.0, left: 10.0, bottom: 10.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  "• To use this site you must be 13 years or older.\n\n• You must not post nude, partially nude, or sexually suggestive photos.\n\n• You will be responsible for any activity that occurs under your profile.\n\n• You are responsible for keeping your profile password safe and secure.\n\n• You must not abuse, harass, impersonate, threaten, or intimidate other Doodlebook users.\n\n• You cannot use the Doodlebook service for any illegal or unauthorized purpose. International users need to comply with all the local laws regarding online conduct and acceptable content.\n\n• You will be solely responsible for your conduct and any data, text, information, graphics, photos, profiles, audio clips and video clips, links and other content that you submit, post, and display on the Doodlebook.\n\n• You must not modify, adapt or hack Doodlebook or modify another website so as to falsely indicate that it is associated with Doodlebook.\n\n• You must not crawl, scrape, or otherwise cache any content from Doodlebook including user profiles and photos. However, this list is not exhaustive and may include any relevant content.\n\n• You shall not use web URLs in your name without a prior written consent from Doodlebook.\n\n• You are not allowed to transmit any worms or viruses or any code of a destructive nature.\n\n• While using Doodlebook, you must not violate any laws in your jurisdiction including copyright laws and all other applicable laws.\n\n•Violation of any of the above listed agreements will result in the termination of your Doodlebook account. Doodlebook prohibits such conduct and content on its site. You understand and agree that Doodlebook will not be responsible for the Content posted on its website by the users and you nonetheless may be exposed to such content or materials; you use the Doodlebook service at your own risk.",
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
              Container(
                padding: EdgeInsets.only(top: 10.0, left: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  "General Conditions",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "SourceSansPro",
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10.0, left: 10.0, bottom: 10.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  "• We reserve the right to modify or terminate the service for any reason at anytime without notice.\n\n• We reserve the right to alter the Terms of Use and other conditions at any time. If the alterations comprises of a material change to the Terms of Use, we will notify you via e-mail as per the preference intimated on your account. What constitutes a MATERIAL CHANGE will be determined at our sole discretion bona fide and using common sense and reasonable sense of judgement.\n\n• We reserve the right to refuse service to anyone at anytime for any reason.\n\n• We reserve the right to forfeit any username that becomes inactive, or violates trademark, or may mislead others.\n\n• We may but have no obligation to remove content and accounts containing content that we determine in our discretion as unlawful, offensive, threatening, libelous, defamatory, obscene or otherwise objectionable or violates any party's intellectual property rights or any of the Terms of Use and other conditions.\n\n• We reserve the right to reclaim usernames on behalf of businesses or individuals that already (or otherwise) hold a legal claim or trademark on those usernames.",
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
              Container(
                padding: EdgeInsets.only(top: 10.0, left: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  "How we use your information",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "SourceSansPro",
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10.0, left: 10.0, bottom: 10.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  "We use the information we collect in various ways, including to:\n\n• Provide, operate, and maintain our website.\n\n• Improve, personalize, and expand our website.\n\n• Understand and analyze how you use our website.\n\n• Develop new products, services, features, and functionality.\n\n•Communicate with you, either directly or through one of our partners, including for customer service, to provide you with updates and other information relating to the website, and for marketing and promotional purposes.\n\n• Send you emails.\n\n• Find and prevent fraud.",
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
              Container(
                padding: EdgeInsets.only(top: 10.0, left: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Proprietary Rights in Content on Doodlebook",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "SourceSansPro",
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10.0, left: 10.0, bottom: 10.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  "• Doodlebook does not claim any ownership rights in any of the content i.e. text, files, images, videos, sounds and other musical works, works of authorship, applications, other related content etc. that you post on or through the Doodlebook Services. By posting any content or material on or through the Doodlebook site, you hereby grant to Doodlebook a non-exclusive, fully-paid and royalty-free, worldwide and limited license to use, modify, delete from, add to, publicly perform, publicly display, reproduce and translate such content, or otherwise, distributing part or all of the site in any media formats through any media channels, except content not shared publicly (i.e. the content you post privately will not be distributed outside the Doodlebook Service).\n\n• Some of the Doodlebook Services are supported by advertising and promtotional revenue and thus we may display advertisements and promotions on our platform, and you are hereby agreeing that Doodlebook may place such advertorial and other promotional content on the Doodlebook platform or on, about, or in conjunction with your Content. The mode, manner, and extent of such advertising and promotions are subject to change or other modifications without any specific notice to you.\n\n• You represent and warrant that: (a) you own the content published by you on or through the Doodlebook platform or otherwise have the right to grant the license attributed in this section, (ii) the publication and use of your content on or through the Doodlebook platform does not violate the privacy rights, publicity rights, copyrights, contract rights, trademark, patents, intellectual property rights or any other rights of any person, and (iii) the publication of your Content on the platform does not result in any breach of contract between you and a third party. You agree to pay for all royalties, fees, and any other monies owing to any person by reason of content you publish on or through the Doodlebook Services.\n\n• The Doodlebook Services contain content of Doodlebook. The content on Doodlebook is protected by the intellectual property rights and other relevant laws, and Doodlebook owns and reserves all rights in the Doodlebook Content and the Doodlebook Services. Doodlebook is hereby granting you a limited, non-sublicensable, and revocable license to modify or replicate and use the Doodlebook content except any software code, solely for your personal use and purpose in connection with viewing the platform and using the Doodlebook Services.\n\n• The Doodlebook Services contain content of its users and other Doodlebook licensors. Except as provided within this Agreement, you cannot copy, modify, change, translate, publish, broadcast, transmit, distribute, perform, display, or sell any content appearing on or through the Doodlebook Services.\n\n•Doodlebook executes technical functions necessary to offer the Doodlebook Services on this platform, including transcoding or reformatting content to allow its use throughout the platform.\n\n•Although the platform and other Doodlebook Services are normally available at all times, there will be a few occasions when the platform or other Doodlebook Services will be interrupted for scheduled maintenance work or upgrades, for emergency repairs, or due to failure of telecommunications links and equipment that are beyond the control of Doodlebook. Although Doodlebook will normally only delete content that violates the conditions of this Agreement, Doodlebook reserves the right to delete any content for any reason, without any prior notice. The deleted content may be stored by Doodlebook in order to comply with certain legal obligations and is not retrievable without a valid order of court. Accordingly, Doodlebook encourages its users to maintain their own backup of their Content. Simply put, Doodlebook does not provide any backup service and thereby Doodlebook will not be liable to you for any suspension, modification, or discontinuation of the Doodlebook Services, or any loss of content.",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "SourceSansPro",
                    fontWeight: FontWeight.w300,
                    color: Color(0xFF525252),
                  ),
                ),
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
