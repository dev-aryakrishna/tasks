import 'package:app_loc/screens/login_screen.dart';
import 'package:flutter/material.dart';
import '../sevices/auth_service.dart';
import '../utils/validators.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../utils/app_errors.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool ishidden = false;
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  void _showSnackbar(String errorCode) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppErrors.getMessage(errorCode))));
    }


  Future<void> signUp() async {

    final nameError =  Validators.validateName(nameController.text);
    if(nameError != null ){
      _showSnackbar(nameError);
      return;
      }

      final phoneError =  Validators.validatePhone(phoneController.text);
      if(phoneError != null ){
      _showSnackbar(phoneError);
      return;
      }
    

    final emailError =  Validators.validateEmail(emailController.text);
    if(emailError != null ){
      _showSnackbar(emailError);
      return;
      }
      

    final passError =  Validators.validatePassword(passwordController.text);
    if(passError != null ){
      _showSnackbar(passError);
      return;
      }

    final confirmpassError =  Validators.validateConfirmPassword(passwordController.text, confirmpasswordController.text);
    if(confirmpassError != null ){
      _showSnackbar(confirmpassError);
      return;
      }

      
   
    try {
      await AuthService().signUp(
        nameController.text.trim(),
        phoneController.text.trim(),
        emailController.text.trim(),
        passwordController.text,
      );
      
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("signup sucess")));


      if(!mounted)return;

     Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>LoginScreen()));
     
    } 
    
    on AuthException catch (e) {
       final code = e.message.contains("already") ? AppErrors.emailAlreadyInUse : AppErrors.signupFailed;
      _showSnackbar(code);
    }
    catch (_) {
      _showSnackbar(AppErrors.signupFailed);
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
              controller: nameController,
              decoration: InputDecoration(
                hint: Text("Name"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hint: Text("Phone"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),

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

            TextField(
              controller: confirmpasswordController,
              obscureText: true,
              decoration: InputDecoration(
                hint: Text("confirm password"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10))
              ),
            ),
            SizedBox(height: 20,),

            ElevatedButton(onPressed: signUp, child: Text("Sign-Up")),
          ],
        ),
      ),
    );
  }
}
