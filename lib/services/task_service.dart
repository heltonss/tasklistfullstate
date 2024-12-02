import 'package:flutter/material.dart';

class TaskService extends ChangeNotifier {
  final List<Map<String, String>> _tasks = [
    {
      "title": "lassie",
      "description": "lassie e doce e gosta muito de brincar"
    },
  ];

  List<Map<String, String>> get tasks => List.unmodifiable(_tasks);

  void addTask(String title, String description) {
    _tasks.add({"title": title, "description": description});
    notifyListeners(); // Notifica ouvintes sobre mudanças
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
    notifyListeners(); // Notifica ouvintes sobre mudanças
  }
}
