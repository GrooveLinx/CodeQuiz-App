import 'package:code_quiz_app/Database/temp-db.dart';
import 'package:code_quiz_app/pages/developers-page.dart';
import 'package:code_quiz_app/pages/welcome_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int _currentIndex = 0;

// <<<==========  QUESTION BOX ==========>>>
  Padding question() {
    return Padding(
      padding: EdgeInsets.only(top: 8, left: 30, right: 30, bottom: 38),
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(4, 5),
                blurRadius: 17,
                color: Color(0xFFb36349),
                spreadRadius: 1.4,
              )
            ],
            color: Color(0xFFb3635b),
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              //   style: BorderStyle.solid,
              color: Color(0xFFb3635b),
            )),
        height: MediaQuery.of(context).size.height * 0.23,
        child: Center(
            child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            questionBank[_currentIndex % questionBank.length].questionText,
            style: TextStyle(
              fontFamily: 'Ubuntu',
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        )),
      ),
    );
  }

// <<<==========  PRE QUESTION  ==========>>>

  Container preQuestion() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(5, 6),
              blurRadius: 10,
              color: Color(0xFFA0766E),
              spreadRadius: 2,
            )
          ],
          borderRadius: BorderRadius.circular(0.0),
          ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Color(0xFF494b68)),
        onPressed: () {
          setState(() {
            _currentIndex--;
          });
        },
        child: Icon(
          Icons.keyboard_arrow_left,
          color: Colors.white,
        ),
      ),
    );
  }

// <<<==========  TRUE ANSWER  ==========>>>

  Container chechkAnswerTrue(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: Offset(2, 5),
                blurRadius: 10,
                color: Color(0xFFA0766E),
                spreadRadius: 2)
          ],
          borderRadius: BorderRadius.circular(0.0),
         ),
      child: Container(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Color(0xFF494b68)),
          onPressed: () => _checkAnswer(true, context),
          child: Text(
            'TRUE',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

// <<<========== FALSE ANSWER  ==========>>>

  Container checkAnswerFalse(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: Offset(2, 5),
                blurRadius: 10,
                color: Color(0xFFA0766E),
                spreadRadius: 2)
          ],
          borderRadius: BorderRadius.circular(0.0),
           ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Color(0xFF494b68)),
        onPressed: () => _checkAnswer(false, context),
        child: Text(
          'FALSE',
          style: TextStyle(
            color: Colors.white,
            fontSize: 19.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

//  <<<========== NEXT QUESTION  ==========>>>

  Container nextQuestion() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: Offset(2, 5),
                blurRadius: 10,
                color: Color(0xFFA0766E),
                spreadRadius: 2)
          ],
          borderRadius: BorderRadius.circular(0.0),
         ),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Color(0xFF494b68)),
          onPressed: () {
            setState(() {
              _currentIndex++;
            });
          },
          child: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.white,
          )),
    );
  }

// <<<==========  STATE CHECK (ANSWER ANALYSIS SECTION)  ==========>>>

  _checkAnswer(bool ansChoice, BuildContext context) {
    if (ansChoice == questionBank[_currentIndex].isCorrect) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % questionBank.length;
      });
      debugPrint('yes correct');
      final snackBar = SnackBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(22.0),
                topRight: Radius.circular(22.0))),
        backgroundColor: Colors.green.withOpacity(0.9),
        duration: Duration(milliseconds: 500),
        content: Text('Correct',
            style: TextStyle(
                fontSize: 20,
                letterSpacing: 1,
                fontFamily: 'Kufam',
                fontWeight: FontWeight.w500)),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      debugPrint('incorrect');
      final snackBar = SnackBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22.0),
              topRight: Radius.circular(22.0))),
        backgroundColor: Colors.red.withOpacity(0.9),
        duration: Duration(milliseconds: 500),
        content: Text('Wrong',
            style: TextStyle(
              fontSize: 20,
              letterSpacing: 1,
              fontFamily: 'Kufam',
              fontWeight: FontWeight.w500,
            )),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF442C3E),
          title: Text(
            'CodeQuiz',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: 'Ubuntu',
            ),
          ),
          centerTitle: true,
          elevation: 19,
          actions: [
            IconButton(
                icon: Icon(Icons.developer_board_outlined),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DeveloperPage()));
                }),
          ],
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WelcomePage()));
            },
          ),
        ),
        body: Container(
            color: Color(0xFFFCFFCE),
            child: SafeArea(
              child: Builder(
                builder: (BuildContext context) => Container(
                  child: ListView(
                    children: [
                      Container(
                        child: Center(
                          child: Image.asset(
                            'images/coder.png',
                            height: MediaQuery.of(context).size.height * .4,
                            width: MediaQuery.of(context).size.width * .7,
                          ),
                        ),
                      ),
                      question(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          preQuestion(),
                          chechkAnswerTrue(context),
                          checkAnswerFalse(context),
                          nextQuestion(),
                        ],
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            )));
  }
}
