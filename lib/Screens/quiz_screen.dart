import 'package:flutter/material.dart';
import 'package:quiz_app/Models/color.dart';
import 'package:quiz_app/Screens/result_screen.dart';
import '../Component/quiz.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

  int _questionIndex = 0;

  int userPercentage = 0;
  int wrongQ = 0;
  int ommitedQuestion = 0;
  int totalRight = 0;

  List<Map<String, Object>> _questions = [
    {
      "id": 1,
      "answer": "South Africa",
      "answer_discription": "",
      "is_answered": 0,
      "is_answer_status_right_wrong_omitted": 0,
      "title":
      "1) In what country was Elon Musk born?",
      "options": [
        {
          "option": "A.",
          "value": "South Africa",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "B.",
          "value": "America",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "C.",
          "value": "England",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "D.",
          "value": "Portgul",
          "color": "0xFFFFFFFF",
        },
      ],
    },
    {
      "id": 2,
      "answer": "Mercury",
      "answer_discription": "",
      "is_answered": 0,
      "is_answer_status_right_wrong_omitted": 0,
      "title":
      "2) What planet is closest to the sun?",
      "options": [
        {
          "option": "A.",
          "value": "Mars",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "B.",
          "value": "Mercury",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "C.",
          "value": "Pluto",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "D.",
          "value": "Neptune",
          "color": "0xFFFFFFFF",
        },
      ],
    },
    {
      "id": 3,
      "answer": "Nokia",
      "answer_discription": "",
      "is_answered": 0,
      "is_answer_status_right_wrong_omitted": 0,
      "title":
      "3) What phone company produced the 3310?",
      "options": [
        {
          "option": "A.",
          "value": "Samsung",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "B.",
          "value": "Oppo",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "C.",
          "value": "Nokia",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "D.",
          "value": "Motrolla",
          "color": "0xFFFFFFFF",
        },
      ],
    },
    {
      "id": 4,
      "answer": "Dublin",
      "answer_discription": "",
      "is_answered": 0,
      "is_answer_status_right_wrong_omitted": 0,
      "title":
      "4) What is the capital of Ireland?",
      "options": [
        {
          "option": "A.",
          "value": "Berlin",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "B.",
          "value": "Dublin",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "C.",
          "value": "Denver",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "D.",
          "value": "Lisban",
          "color": "0xFFFFFFFF",
        },
      ],
    },
    {
      "id": 5,
      "answer": "Asia",
      "answer_discription": "",
      "is_answered": 0,
      "is_answer_status_right_wrong_omitted": 0,
      "title":
      "5) On what continent would you find the city of Baku?",
      "options": [
        {
          "option": "A.",
          "value": "Europe",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "B.",
          "value": "Australia",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "C.",
          "value": "Africa",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "D.",
          "value": "Asia",
          "color": "0xFFFFFFFF",
        },
      ],
    },
  ];

  void quizResult() {
    userPercentage = 0;
    wrongQ = 0;
    ommitedQuestion = 0;
    totalRight = 0;

    for (int i = 0; i < _questions.length; i++) {
      if (_questions[i]['is_answer_status_right_wrong_omitted'] == 0) {
        ommitedQuestion++;
      }
      if (_questions[i]['is_answer_status_right_wrong_omitted'] == 1) {
        totalRight++;
      }
      if (_questions[i]['is_answer_status_right_wrong_omitted'] == 2) {
        wrongQ++;
      }
    }

    userPercentage = ((totalRight / _questions.length) * 100).round();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            userPercentage: userPercentage,
            totalRight: totalRight,
            wrongQ: wrongQ,
            ommitedQuestion: ommitedQuestion,
          ),
        ),
            (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: background,
      body: Column(
        children: [
          SizedBox(
            height: 35,
          ),
          Center(child: Text('First Quiz',style: TextStyle(
              fontSize: 26,fontWeight: FontWeight.bold,
            // color: neutral,
          ))),
          Expanded(
            child: Container(
              child: Quiz(questions: _questions),

            ),

          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          quizResult();
        },
        label:
        Text( //_questionIndex == _questions.length - 1 ?
        "Submit"
           // : "Next"
        ),
      ),
    );
  }
}



