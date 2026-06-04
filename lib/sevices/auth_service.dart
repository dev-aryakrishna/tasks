import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final supabase = Supabase.instance.client;

  Future<void> signUp(String email, String password) async {
    
    await supabase.auth.signUp(email: email, password: password);
  }

  Future<void> login(String email, String password) async {
    final response = await supabase.auth.signInWithPassword(email: email ,password: password);
    print("LOGIN SUCESS");
    print(response.session);
  }
}
