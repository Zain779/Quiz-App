
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:quiz_app/utils/routes_name.dart';
import 'package:quiz_app/utils/utils.dart';

class LoginController with ChangeNotifier{

  FirebaseAuth auth=FirebaseAuth.instance;


  bool _loading=false;
  bool get loading => _loading;
  setLoading(bool value){
    _loading=value;
    notifyListeners();
  }
  void isLogin(BuildContext context){
    final user=auth.currentUser;
    if(user!=null){
      // SessionController().userId=user.uid.toString();
      Navigator.pushNamed(context, RoutesName.homeScreen);
    }else{
      Navigator.pushNamed(context, RoutesName.loginScreen);
    }
  }

  void Login( String email, String Password)async{
    setLoading(true);
    try{
      auth.signInWithEmailAndPassword(
        email: email,
        password: Password,
      ).then((value){

      }).onError((error, stackTrace) {
        setLoading(false);
        utils().toastMessage(error.toString());
      });

    }catch(e){
      utils().toastMessage(e.toString());
    }
  }

}