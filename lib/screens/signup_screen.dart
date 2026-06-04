import 'package:app_loc/screens/login_screen.dart';
import 'package:flutter/material.dart';
import '../sevices/auth_service.dart';
import '../utils/validators.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> signUp() async {
    final emailError =  Validators.validateEmail(emailController.text);
    if(emailError != null ){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('emailError')));
      }

    final passError =  Validators.validatePassword(emailController.text);
    if(passError != null ){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("passError")));
      }
   
    try {
      await AuthService().signUp(
        emailController.text.trim(),
        passwordController.text,
      );
      
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("signup sucess")));


      if(!mounted)return;

     Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>LoginScreen()));
     
    } 
    catch (e) {
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

            ElevatedButton(onPressed: signUp, child: Text("Sign-Up")),
          ],
        ),
      ),
    );
  }
}
