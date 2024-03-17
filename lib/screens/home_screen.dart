import 'package:flutter/material.dart';
import 'package:app_lista_tareas/widgets/task_list_tile.dart';
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
        title: Text('Lista de Tareas'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _filteredTasks.length,
              itemBuilder: (context, index) {
                return TaskListTile(
                  task: _filteredTasks[index],
                  onCheckboxChanged: (value) {
                    setState(() {
                      _filteredTasks[index].isCompleted = value!;
                    });
                  },
                  onDelete: () {
                    setState(() {
                      _filteredTasks[index].isDeleted = true; // Marcar como eliminada
                    });
                  },
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HistoryScreen(tasks: widget.tasks)));
                },
                child: Text('Historial'),
              ),
              SizedBox(width: 16), // Espacio entre los botones
              ElevatedButton(
                onPressed: () {
                  _showAddTask(context);
                },
                child: Text('Agregar Tarea'),
              ),
            ],
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

