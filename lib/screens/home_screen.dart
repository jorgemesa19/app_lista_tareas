import 'package:flutter/material.dart';
//import 'package:app_lista_tareas/widgets/task_list_tile.dart';
import 'package:app_lista_tareas/models/task.dart';
import 'package:app_lista_tareas/widgets/add_task_dialog.dart';
import 'package:app_lista_tareas/screens/history_screen.dart';

class HomeScreen extends StatefulWidget {
  final List<Task> tasks;

  HomeScreen({required this.tasks});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> get _filteredTasks =>
      widget.tasks.where((task) => !task.isDeleted).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tareas', style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.lightBlue.shade200,
      ),
      body: ListView.builder(
        itemCount: _filteredTasks.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                title: Text(_filteredTasks[index].title),
                leading: Checkbox(
                  value: _filteredTasks[index].isCompleted,
                  onChanged: (value) {
                    setState(() {
                      _filteredTasks[index].isCompleted = value!;
                    });
                  },
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    setState(() {
                      _filteredTasks[index].isDeleted = true;
                    });
                  },
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HistoryScreen(tasks: widget.tasks)),
              );
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

    // Verificar si se ha agregado una nueva tarea
    if (result != null && result is Task) {
      setState(() {
        widget.tasks.add(result);
      });
    }
  }
}
