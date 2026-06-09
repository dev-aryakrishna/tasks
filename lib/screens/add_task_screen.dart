import 'package:app_loc/utils/app_errors.dart';
import 'package:app_loc/utils/validators.dart';
import 'package:flutter/material.dart';
import '../sevices/ task_service.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});
  @override
  State<AddTaskScreen> createState() => _AddTaskScreen();
}

class _AddTaskScreen extends State<AddTaskScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  void _showSnackbar(String errorCode) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppErrors.getMessage(errorCode))));
    }
  Future<void> saveTask() async {
    final titleError = Validators.validateTaskTitile(titleController.text);
    if (titleError != null){
       _showSnackbar(titleError);
      return;
    }

    final descriptionError = Validators.validateDescription(descriptionController.text);
    if (descriptionError != null){
       _showSnackbar(descriptionError);
      return;
    }



      await TaskService().addTask(
        titleController.text,
        descriptionController.text,
      );

    if (!mounted) return;

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Task App")),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hint: Text("title"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            SizedBox(height: 20),

            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                hint: Text("description"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(onPressed: saveTask, child: Text("Task saved")),
          ],
        ),
      ),
    );
  }
}
