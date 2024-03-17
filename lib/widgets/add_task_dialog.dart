import 'package:flutter/material.dart';
import 'package:app_lista_tareas/models/task.dart';

class AddTaskDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTaskTitle = ''; // Variable para almacenar el título de la nueva tarea

    return AlertDialog(
      title: Text('Agregar Nueva Tarea'),
      content: TextField(
        onChanged: (value) {
          newTaskTitle = value; // Actualiza el título de la nueva tarea cuando cambia el texto en el TextField
        },
        decoration: InputDecoration(
          hintText: 'Nombre de la Tarea',
        ),
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
              // Crear una nueva tarea
              Task newTask = Task(title: newTaskTitle);
              // Devolver la nueva tarea al cerrar el diálogo
              Navigator.of(context).pop(newTask);
            }
          },
          child: Text('Aceptar'),
        ),
      ],
    );
  }
}
