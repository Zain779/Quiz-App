import 'package:flutter/material.dart';
import 'package:quiz_app/Models/color.dart';
class Button extends StatelessWidget {
  final String title;

  final bool loading;
  const Button({Key? key,
    required this.title,
    this.loading=false,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 300,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
          child: Text( title ,
            style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: 'Rubik Regular',
                color: Color(0xFF1d1a5f),
            ),
          )
      ),
    );
  }
}
