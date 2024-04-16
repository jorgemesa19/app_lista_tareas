// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Agrega esta línea

import 'package:app_lista_tareas/models/task.dart';
import 'package:app_lista_tareas/models/task_provider.dart';

class AddTaskDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTaskTitle = '';

    return AlertDialog(
      title: Text('Agregar nueva tarea'),
      content: TextField(
        onChanged: (value) {
          newTaskTitle = value;
        },
        decoration: InputDecoration(
          hintText: 'Nombre de la tarea',
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () {
            if (newTaskTitle.isNotEmpty) {
              String taskId = UniqueKey().toString(); // Genera un nuevo ID único
              Task newTask = Task(id: taskId, title: newTaskTitle); // Pasa el ID al crear la nueva tarea
              Provider.of<TaskProvider>(context, listen: false).addTask(newTask);
              Navigator.of(context).pop();
            }
          },
          child: Text('Aceptar'),
        ),
      ],
    );
  }
}
