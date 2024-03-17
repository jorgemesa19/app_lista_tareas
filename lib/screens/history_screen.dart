import 'package:flutter/material.dart';
import 'package:app_lista_tareas/models/task.dart';

class HistoryScreen extends StatelessWidget {
  final List<Task> tasks;

  HistoryScreen({required this.tasks});

  @override
  Widget build(BuildContext context) {
    List<Task> completedDeletedTasks = tasks.where((task) => task.isCompleted && task.isDeleted).toList();
    List<Task> incompleteDeletedTasks = tasks.where((task) => !task.isCompleted && task.isDeleted).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Historial'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Tareas Completadas Eliminadas:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: completedDeletedTasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(completedDeletedTasks[index].title),
                  trailing: Icon(Icons.delete, color: Colors.red),
                );
              },
            ),
            SizedBox(height: 20),
            const Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Tareas Incompletas Eliminadas:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: incompleteDeletedTasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(incompleteDeletedTasks[index].title),
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
