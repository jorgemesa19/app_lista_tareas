import 'package:flutter/material.dart';
import 'package:app_lista_tareas/widgets/task_list_tile.dart'; // Importa el widget TaskListTile aquí
import 'package:app_lista_tareas/models/task.dart'; // Importa el modelo Task aquí

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
              _showAddTaskDialog(context);
            },
            child: Text('Agregar Tarea'),
          ),
        ],
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    String newTaskTitle = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Agregar Nueva Tarea'),
          content: TextField(
            onChanged: (value) {
              newTaskTitle = value;
            },
            decoration: InputDecoration(hintText: 'Nombre de la Tarea'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el diálogo
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                if (newTaskTitle.isNotEmpty) {
                  setState(() {
                    tasks.add(Task(title: newTaskTitle));
                  });
                  Navigator.of(context).pop(); // Cerrar el diálogo
                }
              },
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }
}
