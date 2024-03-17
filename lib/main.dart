import 'package:flutter/material.dart';
import 'package:app_lista_tareas/screens/home_screen.dart'; // Importa la pantalla HomeScreen aquí
import 'package:app_lista_tareas/screens/history_screen.dart'; // Importa la pantalla HistoryScreen aquí

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Tareas App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/', // Ruta inicial
      routes: {
        '/': (context) => HomeScreen(),
        '/history': (context) => HistoryScreen(tasks: [], deletedTasks: []), // Pasar una lista vacía de tareas como argumento inicial
      },
    );
  }
}
