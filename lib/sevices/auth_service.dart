import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  SupabaseClient get supabase => Supabase.instance.client;
  Future<void> signUp(String name, String phone,String email, String password) async {
    
   final response =  await supabase.auth.signUp(email: email, password: password);
   final user = response.user;
   if(user == null){
    throw Exception("Signup failed");
   }
    await supabase.from('profiles').insert({'id':user.id,'name':name , 'phone':phone , 'email':email});
    print("Signup success");
  }

  Future<void> login(String email, String password) async {
    final response = await supabase.auth.signInWithPassword(email: email ,password: password);
    print("LOGIN SUCESS");
    print(response.session);
  }

  Future<void> logout() async {
    await supabase.auth.signOut();
  }
}
