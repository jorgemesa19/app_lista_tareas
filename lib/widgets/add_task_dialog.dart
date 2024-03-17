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
              Task newTask = Task(title: newTaskTitle); // Crea una nueva instancia de Task con el título proporcionado
              Navigator.of(context).pop(newTask); // Envía la nueva tarea de vuelta al widget que mostró el diálogo
            }
          },
          child: Text('Aceptar'),
        ),
      ],
    );
  }
}
