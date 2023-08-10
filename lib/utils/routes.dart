




import 'package:flutter/material.dart';
import 'package:quiz_app/Screens/home_screen.dart';
import 'package:quiz_app/Screens/login_screen.dart';
import 'package:quiz_app/Screens/quiz_screen.dart';
import 'package:quiz_app/Screens/signup_screen.dart';
import 'package:quiz_app/utils/routes_name.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name){
      case RoutesName.loginScreen:
        return MaterialPageRoute(builder: (context)=> LoginScreen());
      case RoutesName.signupScreen:
        return MaterialPageRoute(builder: (context)=> SignupScreen());
      case RoutesName.homeScreen:
        return MaterialPageRoute(builder: (context)=> HomeScreen());
      case RoutesName.quizScreen:
        return MaterialPageRoute(builder: (context)=> QuizScreen());
      default:
        return MaterialPageRoute(builder: (context){
          return const Scaffold(
            body: Center(
              child: Text('No route define'),
            ),
          );
        });

    }
  }
}