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
        title: const Text('Historial', style: TextStyle(color: Color.fromARGB(223, 0, 0, 0))),
        backgroundColor: Colors.lightBlue[200], // Color azul claro
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Tareas completadas eliminadas', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(
              height: 150, // Ajusta la altura de la lista según sea necesario
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
                        trailing: const Icon(Icons.check_circle, color: Colors.green),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Tareas incompletas eliminadas', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(
              height: 150, // Ajusta la altura de la lista según sea necesario
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
                        trailing: const Icon(Icons.cancel_rounded, color: Colors.red),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
