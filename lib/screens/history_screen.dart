import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_lista_tareas/models/task.dart';
import 'package:app_lista_tareas/models/task_provider.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial'),
      ),
      body: StreamBuilder<List<Task>>(
        stream: Provider.of<TaskProvider>(context).getTasks(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          List<Task> tasks = snapshot.data!;
          List<Task> completedDeletedTasks = tasks.where((task) => task.isCompleted && task.isDeleted).toList();
          List<Task> incompleteDeletedTasks = tasks.where((task) => !task.isCompleted && task.isDeleted).toList();

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Tareas completadas eliminadas', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: completedDeletedTasks.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            title: Text(completedDeletedTasks[index].title),
                            trailing: Icon(Icons.check_circle, color: Colors.green),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Tareas incompletas eliminadas', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: incompleteDeletedTasks.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            title: Text(incompleteDeletedTasks[index].title),
                            trailing: Icon(Icons.cancel_rounded, color: Colors.red),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
