import 'package:flutter/material.dart';
import 'package:app_lista_tareas/models/task.dart';

class AddTaskDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTaskTitle = '';

    return AlertDialog(
      title: const Text('Agregar nueva tarea'),
      content: TextField(
        onChanged: (value) {
          newTaskTitle = value;
        },
        decoration: const InputDecoration(
          hintText: 'Nombre de la tarea',
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancelar', style: TextStyle(color: Colors.black87)),
        ),
        ElevatedButton(
          onPressed: () {
            if (newTaskTitle.isNotEmpty) {
              Task newTask = Task(title: newTaskTitle);
              Navigator.of(context).pop(newTask);
            }
          },
          child: const Text('Aceptar', style: TextStyle(color: Colors.black87)),
        ),
      ],
    );
  }
}
