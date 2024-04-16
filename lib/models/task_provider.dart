import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app_lista_tareas/models/task.dart';

class TaskProvider extends ChangeNotifier {
  final CollectionReference _tasksCollection = FirebaseFirestore.instance.collection('tasks');

  Future<void> addTask(Task task) async {
    try {
      await _tasksCollection.add(task.toMap());
      notifyListeners();
    } catch (e) {
      print("Error adding task: $e");
    }
  }

  Stream<List<Task>> getTasks() {
    return _tasksCollection.snapshots().map((snapshot) => snapshot.docs.map((doc) => Task.fromFirestore(doc)).toList());
  }

  Future<void> toggleTaskCompletion(String taskId, bool isCompleted) async {
    try {
      await _tasksCollection.doc(taskId).update({'isCompleted': isCompleted});
      notifyListeners();
    } catch (e) {
      print("Error toggling task completion: $e");
    }
  }

  Future<void> deleteTask(String taskId) async {
    try {
      await _tasksCollection.doc(taskId).delete();
      notifyListeners();
    } catch (e) {
      print("Error deleting task: $e");
    }
  }
}
