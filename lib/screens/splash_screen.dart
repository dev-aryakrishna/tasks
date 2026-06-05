
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'home_screen.dart';
import 'login_screen.dart';



class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});
  @override
  State<SplashScreen>createState()=>_SplashScreen();
}

class _SplashScreen extends State<SplashScreen>{
@override
void initState() {
  super.initState();
  checkLogin();
}
Future<void>checkLogin()async{
  final user = Supabase.instance.client.auth.currentUser;
  print("USER = $user");
  if(!mounted)return;

 WidgetsBinding.instance.addPostFrameCallback((_){
 Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>user!=null? HomeScreen():LoginScreen()));
 },
 );
}
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
   
  }
}
