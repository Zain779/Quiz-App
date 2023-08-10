import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Models/color.dart';
import 'package:quiz_app/Models/SignUp/signup_controller.dart';
import 'package:quiz_app/Widgets/button.dart';
import 'package:quiz_app/Widgets/text_input_field.dart';
import 'package:quiz_app/utils/routes_name.dart';
import 'package:quiz_app/utils/utils.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  final userName=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: background,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ChangeNotifierProvider(
            create: (_)=> SignupController(),
          child: Consumer<SignupController>(
              builder: (context,provider,child){
                return SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 90,),
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
                          'Register your account',
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Rubik Regular',
                              // color: Colors.white
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextInputField(
                            myController: userName,
                            onValidator: (value){
                              return value.isEmpty ?'Enter UserName':null;
                            },
                            obsecureText: false,
                            hint: 'User Name'),
                        SizedBox(height: 15,),
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

                        SizedBox(height: 30,),
                        InkWell(
                          onTap: (){
                            if(_formKey.currentState!.validate()){
                            provider.SignUp(userName.text, emailController.text, passwordController.text);
                            Navigator.pushNamed(context, RoutesName.homeScreen);
                          }

                          },
                          child: Button(title: 'SignUp',
                              loading: provider.loading,
                              ),
                        ),
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account?",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Rubik Regular',
                                  // color: Colors.white
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, RoutesName.loginScreen);
                              },
                              child: const Text(
                                ' Login',
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
                );
          }),
        )
      ),
    );
  }
}
