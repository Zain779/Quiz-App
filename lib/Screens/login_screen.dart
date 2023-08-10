import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Models/color.dart';
import 'package:quiz_app/Widgets/button.dart';
import 'package:quiz_app/Widgets/text_input_field.dart';
import 'package:quiz_app/utils/routes_name.dart';
import 'package:quiz_app/Models/Login/login_controller.dart';
import 'package:switcher_button/switcher_button.dart';

import '../Provider/theme_changer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  final _formKey = GlobalKey<FormState>();

  LoginController status=LoginController();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   status.isLogin(context);
  //   // SchedulerBinding.instance.scheduleFrameCallback((timeStamp) {
  //   //   status.isLogin(context);
  //   // });
  // }

  @override
  Widget build(BuildContext context) {
    final themeChanger=Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(height: 30,),
            RadioListTile<ThemeMode>(
              title: Text('Light Mode',
                // style: TextStyle(color: Colors.white),
              ),
              value: ThemeMode.light,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme,
            ),
            RadioListTile<ThemeMode>(
              title: Text('Dark Mode',
                // style: TextStyle(color: Colors.white),
              ),
              value: ThemeMode.dark,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme,
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
      // backgroundColor: background,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50,),

                const Text(
                  'Quiz App',
                  style: TextStyle(
                      fontSize: 60,
                      fontFamily: 'Rubik Regular',
                      fontWeight: FontWeight.bold,
                      // color: Colors.white
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Sign In to your account',
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Rubik Regular',
                      // color: Colors.white
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextInputField(
                    myController: emailController,
                    onValidator: (value){
                      return value.isEmpty ? 'Enter Email': null;
                    },
                    obsecureText: false,
                    hint: 'Email',
                ),
                SizedBox(height: 15,),
                TextInputField(
                    myController: passwordController,
                    onValidator: (value){
                      return value.isEmpty ?'Enter Password':null;
                    },
                    obsecureText: true,
                    hint: 'Password'),
                SizedBox(height: 5,),
                Align(alignment: Alignment.centerRight,
                  child: Text(
                    'Forget Password',style: TextStyle(fontSize: 16, decoration: TextDecoration.underline,
                      // color: neutral
                  )),
                ),
                SizedBox(height: 30,),
                ChangeNotifierProvider(
                    create: (_)=> LoginController(),
                  child: Consumer<LoginController>(
                      builder: (context,provider,child){
                        return InkWell(
                            onTap:(){
                              if(_formKey.currentState!.validate()){
                                provider.Login(emailController.text, passwordController.text);
                                Navigator.pushNamed(context, RoutesName.homeScreen);
                              }
                            },
                            child: Button(title: 'LogIn'));
                      }
                  ),
                ),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Rubik Regular',
                          // color: Colors.white
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RoutesName.signupScreen);
                      },
                      child: const Text(
                        ' Signup',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Rubik Regular',
                          fontWeight: FontWeight.bold,
                          // color: Colors.white,

                        ),
                        // color: Color(0xff6943ba)),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
