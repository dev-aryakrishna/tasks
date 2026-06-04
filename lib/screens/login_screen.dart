import 'package:app_loc/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import '../sevices/auth_service.dart';
import '../screens/home_screen.dart';
import '../sevices/storage_service.dart';
import '../utils/validators.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  bool ishidden = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
    

  Future<void> login() async {
    final emailError =  Validators.validateEmail(emailController.text);
    if(emailError == null || emailError.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('emailError')));
      }

    final passError =  Validators.validatePassword(emailController.text);
    if(passError == null || passError.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("passError")));
      }
    
    try {
      await AuthService().login(
        emailController.text.trim(),
        passwordController.text,
      );
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("login sucess")));

      await StorageService().saveLogin();

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute
        (builder: (_) => HomeScreen()),
      );
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
                    obscureText: !ishidden,
                    controller: passwordController,
                    decoration: InputDecoration(
                      hint: Text("password"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: IconButton(onPressed: (){
                        setState(() {
                          ishidden = !ishidden;
                        });
                      }, icon: Icon(ishidden ?Icons.visibility :Icons.visibility_off))
                    ),
                  ),

                  SizedBox(height: 20),

                  ElevatedButton(onPressed:
                   login, child: Text("login")),

                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => SignupScreen()),
                      );
                    },
                    child: Text("Don't you have account"),
                  ),
                ],
              ),
            ),
          
        
      
    );
  }
}
