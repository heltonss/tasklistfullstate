import 'package:flutter/material.dart';

class PetConectaService extends ChangeNotifier {
  final List<Map<String, String>> _tasks = [
    {
      "title": "lassie",
      "description": "lassie e doce e gosta muito de brincar",
      "imageUrl": "https://placedog.net/50/50?random"
    },
    {
      "title": "Rambo",
      "description": "lassie e doce e gosta muito de brincar",
      "imageUrl": "https://placedog.net/50/50?random"
    },
    {
      "title": "Magnus",
      "description": "lassie e doce e gosta muito de brincar",
      "imageUrl": "https://placedog.net/50/50?random"
    },
  ];

  List<Map<String, String>> get tasks => List.unmodifiable(_tasks);

  void addPet(String title, String description) {
    _tasks.add({"title": title, "description": description});
    notifyListeners(); // Notifica ouvintes sobre mudanças
  }

  void removePet(int index) {
    _tasks.removeAt(index);
    notifyListeners(); // Notifica ouvintes sobre mudanças
  }
}
