import 'package:flutter/material.dart';
import 'package:quiz_app/Models/color.dart';

class Quiz extends StatefulWidget {
  final List<Map<String, Object>> questions;
  Quiz({
    required this.questions,
  });

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: background,
      body: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(
              itemCount: widget.questions.length,
              itemBuilder: (context,index){
                return Column(
                  children: [
                    SizedBox(
                      height: 35,
                    ),
                    Text(
                      widget.questions[index]['title'] as String,
                      style: TextStyle(fontSize: 20,
                          // color: neutral
                      ),
                    ),
                    SizedBox(height: 20,),
                    widget.questions[index]
                    ['is_answer_status_right_wrong_omitted'] ==
                        2
                        ? Text(
                      "Sorry : Right answer is -> ${widget.questions[index]['answer']} ",
                      style: const TextStyle(
                        // color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    )
                        : const SizedBox(),
                    SizedBox(
                      height: 20,
                    ),
                    ...(widget.questions[index]['options']as List<Map<String, Object>>)
                        .map((e) => Column(
                      children: [
                        SizedBox(height: 10,),
                        Container(
                          width: 320,
                          height: 50,
                          decoration: BoxDecoration(
                            // color: neutral,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Color(
                                int.parse(
                                  e['color'] as String,
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () {
                              if (widget.questions[index]['is_answered'] ==
                                  0) {
                                setState(() {
                                  if (e['value'] ==
                                      widget.questions[index]['answer']) {
                                    e['color'] = "0xFF31CD63";
                                    widget.questions[index][
                                    'is_answer_status_right_wrong_omitted'] = 1;
                                  } else {
                                    e['color'] = "0xFFFF0000";
                                    widget.questions[index][
                                    'is_answer_status_right_wrong_omitted'] = 2;
                                  }
                                  widget.questions[index]['is_answered'] =
                                  1;
                                });

                              } else {}
                            },
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 0),
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Color(
                                        int.parse(
                                          e['color'] as String,
                                        ),
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Text(
                                        e['option'] as String,
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    e['value'] as String,
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                    )

                  ],
                );
              })
      ),

    );
  }
}
