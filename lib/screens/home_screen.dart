import 'package:flutter/material.dart';
import 'package:app_lista_tareas/models/task.dart';
import 'package:app_lista_tareas/widgets/add_task_dialog.dart';
import 'package:provider/provider.dart';
import 'package:app_lista_tareas/models/task_provider.dart';

// ignore: use_key_in_widget_constructors
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tareas', style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.lightBlue.shade200,
      ),
      body: StreamBuilder<List<Task>>(
        stream: Provider.of<TaskProvider>(context).getTasks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay tareas'));
          }
          final tasks = snapshot.data!;
          final filteredTasks = tasks.where((task) => !task.isDeleted).toList();
          return ListView.builder(
            itemCount: filteredTasks.length,
            itemBuilder: (context, index) {
              final task = filteredTasks[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    title: Text(task.title),
                    leading: Checkbox(
                      value: task.isCompleted,
                      onChanged: (value) {
                        Provider.of<TaskProvider>(context, listen: false).toggleTaskCompletion(task.id, value!);
                      },
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        Provider.of<TaskProvider>(context, listen: false).deleteTask(task.id);
                      },
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/history');
            },
            child: const Text('Historial', style: TextStyle(color: Colors.black87)),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {
              _showAddTask(context);
            },
            child: const Text('Agregar', style: TextStyle(color: Colors.black87)),
          ),
        ],
      ),
    );
  }

  void _showAddTask(BuildContext context) async {
    final result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddTaskDialog();
      },
    );

    if (result != null && result is Task) {
      // ignore: use_build_context_synchronously
      Provider.of<TaskProvider>(context, listen: false).addTask(result);
    }
  }
}
