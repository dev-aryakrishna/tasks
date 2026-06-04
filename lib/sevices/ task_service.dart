import 'package:app_loc/models/task_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TaskService {
  final supabase = Supabase.instance.client;

  Future<void> addTask(String title, String description) async {
    final user = supabase.auth.currentUser;
    await supabase.from('tasks').insert({
      'title': title,
      'description': description,
      'user_id': user!.id,
    });
    print("task created");
  }

  Future<List<TaskModel>> getTask() async {
    final user = supabase.auth.currentUser;
    final response = await supabase
        .from('tasks')
        .select()
        .eq('user_id', user!.id);
    return response.map<TaskModel>((task) => TaskModel.fromJson(task)).toList();
  }

  Future<void>deleteTask(int id)async{
    await supabase.from('tasks').delete().eq('id', id);
    print("task deleted");
  }

  Future<void>updateTask(int id , String title , String description , )async{
    await supabase.from('tasks').
    update({'title':title,
    'description':description,
    }).
    eq(
      'id', id
    );
      print("task updated");
  }

  Future<void>toggleTask(int id , bool value )async{
    await supabase.from('tasks').
    update({'is_completed':value
    }).
    eq(
      'id', id
    );
      print("task patched");
  }


}
