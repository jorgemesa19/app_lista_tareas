import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  final String id; // Agregar la propiedad id
  final String title;
  bool isCompleted;
  bool isDeleted;

  Task({required this.id, required this.title, this.isCompleted = false, this.isDeleted = false});

  Map<String, dynamic> toMap() {
    return {
      'id': id, // Incluir el id en el mapa
      'title': title,
      'isCompleted': isCompleted,
      'isDeleted': isDeleted,
    };
  }

  factory Task.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return Task(
      id: doc.id, // Asignar el id del documento
      title: data['title'],
      isCompleted: data['isCompleted'],
      isDeleted: data['isDeleted'],
    );
  }
}
