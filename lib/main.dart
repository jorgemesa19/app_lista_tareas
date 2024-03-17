import 'package:flutter/material.dart';
import 'package:app_lista_tareas/screens/home_screen.dart'; // Importa la pantalla HomeScreen aquí

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
      home: HomeScreen(), // Define HomeScreen como la pantalla inicial de la aplicación
    );
  }
}
