import 'package:supabase_flutter/supabase_flutter.dart';

class  TaskService {

  final supabase = Supabase.instance.client;

  Future<void>addTask(
    String title,
    String description,
  )async{

    final user = supabase.auth.currentUser;
    await supabase.from('tasks').insert({'title':title,
    'description': description,
    'user_id':user!.id});
    print("task created");

  }

  }
