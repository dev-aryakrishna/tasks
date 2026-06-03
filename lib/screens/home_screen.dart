import 'package:app_loc/screens/add_task_screen.dart';
import 'package:app_loc/screens/login_screen.dart';
import 'package:app_loc/sevices/storage_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  Future<void>logout(BuildContext  context)async{
    await StorageService().logout();
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>LoginScreen()), (route)=>false);
  }
  
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
      title: Text("Home"),actions: [IconButton(onPressed: () => logout(context), icon: Icon(Icons.logout))],
    ),
    body: Center(
      child: Text("welcome"),
    ),
     
    floatingActionButton: FloatingActionButton(onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (_)=>AddTaskScreen()));
    },child: Icon(Icons.add),),
   );
  }
}