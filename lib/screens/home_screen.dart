import 'package:app_loc/models/task_model.dart';
import 'package:app_loc/screens/add_task_screen.dart';
import 'package:app_loc/screens/login_screen.dart';
import 'package:app_loc/sevices/%20task_service.dart';
import 'package:app_loc/sevices/storage_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> logout(BuildContext context) async {
    await StorageService().logout();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => LoginScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home",style: TextStyle(),),
        actions: [
          IconButton(
            onPressed: () => logout(context),
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: FutureBuilder<List<TaskModel>>(
        future: TaskService().getTask(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final tasks = snapshot.data!;
          if (tasks.isEmpty) {
            return Center(child: Text("no task"));
          }
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];

              return ListTile(
                //___________upadte/PATCH__________________________________________
                onLongPress: () async {
                  final titleController = TextEditingController(
                    text: task.title,
                  );
                  final descriptionController = TextEditingController(
                    text: task.description,
                  );

                  await showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Edit task"),

                        content: Column(
                          mainAxisSize: MainAxisSize.min,
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
                          ],
                        ),

                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text("cancel"),
                          ),
                          TextButton(
                            onPressed: () async {
                              await TaskService().updateTask(
                                task.id,
                                titleController.text,
                                descriptionController.text,
                              );

                              if (!context.mounted) return;
                              Navigator.pop(context);
                              setState(() {});
                            },
                            child: Text("update"),
                          ),
                        ],
                      );
                    },
                  );
                },

                title: Text(task.title),
                subtitle: Text(task.description),
                trailing: IconButton(
                  onPressed: () async {
                    await TaskService().deleteTask(task.id);
                    setState(() {});
                  },
                  icon: Icon(Icons.delete_forever_sharp),
                ),

                leading: Checkbox(
                  value: task.isCompleted,
                  onChanged: (value) async {
                    await TaskService().toggleTask(task.id, value!);
                    setState(() {});
                  },
                ),
              );
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddTaskScreen()),
          );
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
