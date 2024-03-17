import 'package:flutter/material.dart';
import 'package:app_lista_tareas/models/task.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> _tasks = []; // Lista de tareas

  List<Task> get tasks => _tasks; // Getter para obtener las tareas

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners(); // Notifica a los oyentes de cambios
  }

  // Otros métodos para modificar las tareas
}
