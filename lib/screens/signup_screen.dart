import 'package:app_loc/screens/login_screen.dart';
import 'package:flutter/material.dart';
import '../sevices/auth_service.dart';
import '../utils/validators.dart';

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


  Future<void> signUp() async {

    final nameError =  Validators.validateName(nameController.text);
    if(nameError != null ){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(nameError)));
      return;
      }

      final phoneError =  Validators.validatePhone(phoneController.text);
      if(phoneError != null ){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(phoneError)));
      return;
      }
    

    final emailError =  Validators.validateEmail(emailController.text);
    if(emailError != null ){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(emailError)));
      return;
      }
      

    final passError =  Validators.validatePassword(passwordController.text);
    if(passError != null ){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(passError)));
      return;
      }

    final confirmpassError =  Validators.validateConfirmPassword(passwordController.text, confirmpasswordController.text);
    if(confirmpassError != null ){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(confirmpassError)));
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
