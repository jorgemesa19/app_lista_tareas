import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_lista_tareas/screens/home_screen.dart'; 
import 'package:app_lista_tareas/screens/history_screen.dart'; 
import 'package:app_lista_tareas/models/task.dart'; 
import 'package:app_lista_tareas/models/task_provider.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(), // Crea una instancia de TaskProvider
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) {
            List<Task> tasks = Provider.of<TaskProvider>(context).tasks;
            return HomeScreen(tasks: tasks); // Pasa la lista de tareas a HomeScreen
          },
          '/history': (context) {
            List<Task> tasks = Provider.of<TaskProvider>(context).tasks;
            return HistoryScreen(tasks: tasks); // Pasa la lista de tareas a HistoryScreen
          },
        },
      ),
    );
  }
}
