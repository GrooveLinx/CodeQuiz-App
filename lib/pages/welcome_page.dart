import 'package:code_quiz_app/pages/home-page.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF442C3E),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.28,
                width: MediaQuery.of(context).size.width * 0.7,  
                  child: Container(
                    child: Text(
                      'Test your programming and coding skills with quizzes!!!'
                    '\n''\n'
                    'Prepare yourself for the job interview! ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Kufam',
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
              GestureDetector(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.10,
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xFF442C3E).withOpacity(0.1),
                            spreadRadius: 10,
                            blurRadius: 15,
                            offset: Offset(5, 3))
                      ],
                      color: Color(0xFFf7e1ed),
                    ),
                    child: Center(
                      child: Text(
                        'Start Quiz',
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Color(0xFF442C3E),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  }),
            ],
          ),
        ));
  }
}
