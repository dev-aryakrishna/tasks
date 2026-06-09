import 'package:app_loc/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import '../sevices/auth_service.dart';
import '../screens/home_screen.dart';
import '../utils/validators.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../utils/app_errors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  bool ishidden = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
    
  void _showSnackbar(String errorCode) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppErrors.getMessage(errorCode))));
    }

  Future<void> login() async {
    final emailError =  Validators.validateEmail(emailController.text);
    if(emailError != null){
     _showSnackbar(emailError,);return;}
      

    final passError =  Validators.validatePassword(passwordController.text);
    if(passError != null ){
      _showSnackbar(passError);
      return;
      }
    
    try {
      await AuthService().login(
        emailController.text.trim(),
        passwordController.text,
      );


      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute
        (builder: (_) => HomeScreen()),
      );
    }on AuthException {
      _showSnackbar(AppErrors.invalidCredentials);
    }
    catch (_) {
      _showSnackbar(AppErrors.invalidCredentials);
    }
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Log")),

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
