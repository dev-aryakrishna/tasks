import 'package:app_loc/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import '../sevices/auth_service.dart';
import '../screens/home_screen.dart';
import '../sevices/storage_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    try {
      await AuthService().login(
        emailController.text.trim(),
        passwordController.text,
      );
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("login sucess")));

      await StorageService().saveLogin();

      if(!mounted)return;

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>HomeScreen()));
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign-Up")),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hint: Text("email"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            SizedBox(height: 20),

            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                hint: Text("password"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(onPressed: login, child: Text("login")),

            SizedBox(height: 20,),
            TextButton(onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>SignupScreen()));
            }, child: Text("Don't you have account",),)
          ],
        ),
      ),
    );
  }
}
