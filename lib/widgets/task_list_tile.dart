import 'package:flutter/material.dart';
import 'package:app_lista_tareas/models/task.dart';

class TaskListTile extends StatelessWidget {
  final Task task;
  final Function(bool?) onCheckboxChanged;
  final Function() onDelete;

  TaskListTile({
    required this.task,
    required this.onCheckboxChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title),
      leading: Checkbox(
        value: task.isCompleted,
        onChanged: onCheckboxChanged,
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: onDelete,
      ),
    );
  }
}
