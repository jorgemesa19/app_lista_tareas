import 'package:flutter/material.dart';
import 'package:app_lista_tareas/models/task.dart';

class HistoryScreen extends StatelessWidget {
  final List<Task> tasks;
  final List<Task> deletedTasks;

  HistoryScreen({required this.tasks, required this.deletedTasks});

  @override
  Widget build(BuildContext context) {
    List<Task> completedTasks = tasks.where((task) => task.isCompleted).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Historial'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Tareas Completadas:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: completedTasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(completedTasks[index].title),
                  trailing: Icon(Icons.check_circle, color: Colors.green),
                );
              },
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Tareas Eliminadas:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: deletedTasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(deletedTasks[index].title),
                  trailing: Icon(Icons.delete, color: Colors.red),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
