import 'dart:ui';
import 'package:code_quiz_app/pages/home-page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class DeveloperPage extends StatefulWidget {
  @override
  _DeveloperPageState createState() => _DeveloperPageState();
}

class _DeveloperPageState extends State<DeveloperPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFCFFCE),
        body: ListView(
              children: [
                Container(
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 1.5,
                        height: MediaQuery.of(context).size.height * .5,
                        child: Image.asset(
                          "images/vectoruser.jfif",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 10,
                        child: IconButton(
                            color: Colors.black,
                            icon: Icon(Icons.arrow_back_ios,
                            color: Color(0xFF442C3E),),
                            onPressed: () {
                              Navigator.pop(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                            }),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xFF442C3E),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1.2,
                            blurRadius: 8,
                            offset: Offset(0, 7),
                          )
                        ]),
                    margin: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * .15,
                      left: MediaQuery.of(context).size.width * .15,
                    ),
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.1,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.developer_board,
                          color: Color(0xFFf7e1ed),
                          size: 35,
                        ),
                        Text(
                          "Developers",
                          style: TextStyle(
                            color: Color(0xFFf7e1ed),
                            fontFamily: "Ubuntu",
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 8.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: Icon(
                            FontAwesomeIcons.facebookSquare,
                            color: Colors.blue[800],
                            size: 40,
                          ),
                           onPressed: () async {
                            const url = 'https://www.facebook.com/rippledevs';
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            FontAwesomeIcons.twitterSquare,
                            color: Colors.blue[600],
                            size: 40,
                          ),
                          onPressed: () async {
                            const url = 'https://www.twitter.com/rippledevs';
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            FontAwesomeIcons.linkedinIn,
                            color: Colors.blue[500],
                            size: 40,
                          ),
                           onPressed: () async {
                            const url = 'https://www.linkedin.com/company/ripplebee';
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.106,
                      width:double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                        ),
                        color: Colors.purple[100]
                      ),
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            text: '         Developed by' '\n' 'The Geeks of ',
                            style: TextStyle(
                                letterSpacing: 1.3,
                                height: 1.3,
                                fontFamily: 'Ubuntu',
                                fontSize: 21,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF442C3E)),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'RippleBee',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 20)),
                            ],
                          ),
                        ),
                      ),
                    ),
              ],
            )
        );
    }
}


// _launchTwitter() async {
//   const url = 'https://www.twitter.com/@rippledevs';
//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }

// _launchFB() async {
//   const url = 'https://www.facebook.com/rippledevs';
//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }

// _launchLinkedIn() async {
//   const url = 'https://www.linkedin.com/company/ripplebee/';
//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }
