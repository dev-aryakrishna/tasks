import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileService {
  final supabase = Supabase.instance.client;
  Future<String> getUserName()async{
    final user = supabase.auth.currentUser;
    final data = await supabase.from('profiles').select('name').eq('id', user!.id).single();
    return data['name'];
  }
}