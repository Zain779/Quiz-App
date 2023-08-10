import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/Models/color.dart';
import 'package:quiz_app/Widgets/button.dart';
import 'package:quiz_app/utils/routes_name.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      // backgroundColor: background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // backgroundColor: background,
        forceMaterialTransparency: true,
        actions: [
          IconButton(onPressed: (){
            FirebaseAuth auth=FirebaseAuth.instance;
            auth.signOut().then((value) {
              // SessionController().userId='';
              Navigator.pushNamed(context, RoutesName.loginScreen);
            });
          }, icon: const Icon(Icons.logout,
            // color: Colors.white,
          ))
        ],
      ),
      body: Column(

        children: [
          Center(child: Text('Quiz App',style: TextStyle(
              // color: neutral,
              fontSize: 64,fontWeight: FontWeight.bold),)),
          const SizedBox(height: 10,),
          Center(
              child: Text('   Challange your mind to think \n                      sharp!',style: TextStyle(fontSize: 22,fontWeight: FontWeight.normal,
                // color: neutral,
              ),)),
          const SizedBox(
            height: 25,
          ),
          // Container(
          //   height: 300,
          //   width: 300,
          //   // child: const Image(image: AssetImage('assets/004.png')),
          //   child: Image(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRR0bOGEBVNszxsa9rBrmAwPk53ztMV8KWD_A&usqp=CAU')),
          // ),
          CircleAvatar(
            radius: 120,
            child: ClipOval(
              child:
              Image(
                image: NetworkImage('https://images.unsplash.com/photo-1591492654773-6756035bef6b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fHRyZWFzdXJlJTIwYm94fGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60'), width: 400,height: 400,fit: BoxFit.cover,),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
           InkWell(
             onTap: (){
               Navigator.pushNamed(context, RoutesName.quizScreen);
             },
               child: Button(title: 'Start Quiz'))
        ],
      ),

    );
  }
}
