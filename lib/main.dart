import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Models/SignUp/signup_controller.dart';
import 'package:quiz_app/Provider/theme_changer.dart';
import 'package:quiz_app/Screens/quiz_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:quiz_app/utils/routes.dart';
import 'package:quiz_app/utils/routes_name.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> ThemeChanger())
      ],
      child: Builder(
          builder: (BuildContext context){
            final themeChanger=Provider.of<ThemeChanger>(context);
        return MaterialApp(
          title: 'Flutter Demo',
          themeMode: themeChanger.themeMode,
          theme: ThemeData(
              brightness: Brightness.light,
            primarySwatch: Colors.cyan,
            // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            primaryColor: Colors.redAccent,
            // useMaterial3: true,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark
          ),
          initialRoute: RoutesName.loginScreen,
          onGenerateRoute: Routes.generateRoute,
        );
      })
    );
  }
}


