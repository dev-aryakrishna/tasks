import 'package:flutter/material.dart';
import '../sevices/ task_service.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});
  State<AddTaskScreen>createState()=> _AddTaskScreen();
}

class _AddTaskScreen extends State<AddTaskScreen>{

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  Future<void>saveTask()async{
    await TaskService().addTask(titleController.text, descriptionController.text);
    if(!mounted)return;

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task App"),
      ),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hint: Text("title"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                )
              ),
            ),


            SizedBox(height: 20,),

            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                hint: Text("description"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                )
              ),
            ),

            SizedBox(height: 20,),

            ElevatedButton(onPressed: saveTask, child: Text("Task saved"),
            )
          ],
        ),
      ),
    );
  }
}
