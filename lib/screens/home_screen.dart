import 'package:flutter/material.dart';
import 'package:app_lista_tareas/widgets/task_list_tile.dart';
import 'package:app_lista_tareas/models/task.dart';
import 'package:app_lista_tareas/widgets/add_task_dialog.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = []; // Define una lista de tareas aquí

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tareas'),
      ),
      body: Column(
        children: [
          // Espacio flexible para la lista de tareas
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return TaskListTile(
                  task: tasks[index],
                  onCheckboxChanged: (value) {
                    setState(() {
                      tasks[index].isCompleted = value!;
                    });
                  },
                  onDelete: () {
                    setState(() {
                      tasks.removeAt(index);
                    });
                  },
                );
              },
            ),
          ),
          // Botón para agregar tarea
          ElevatedButton(
            onPressed: () {
              _showAddTask(context); // Llama a la función para mostrar el diálogo de agregar tarea
            },
            child: Text('Agregar Tarea'),
          ),
        ],
      ),
    );
  }

  void _showAddTask(BuildContext context) async {
    final Task? newTask = await showDialog<Task>(
      context: context,
      builder: (BuildContext context) {
        return AddTaskDialog();
      },
    );

    if (newTask != null) {
      setState(() {
        tasks.add(newTask); // Agrega la nueva tarea a la lista de tareas
      });
    }
  }
}
