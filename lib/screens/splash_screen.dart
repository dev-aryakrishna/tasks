
import 'package:app_loc/sevices/storage_service.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'login_screen.dart';



class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});
  State<SplashScreen>createState()=>_SplashScreen();
}

class _SplashScreen extends State<SplashScreen>{
@override
void initState() {
  super.initState();
  checkLogin();
}
Future<void>checkLogin()async{
  final value = await StorageService().getLogin();
  if(!mounted)return;

  if(value == "true"){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>HomeScreen()));
  }
  else{
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>LoginScreen()));
   
  }
}
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
   
  }
}
