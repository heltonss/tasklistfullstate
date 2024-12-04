import 'package:flutter/material.dart';
import 'package:petconecta/pages/add_pet.dart';
import 'package:petconecta/services/pet_conecta_service.dart';
import 'package:provider/provider.dart';

class PetListPage extends StatefulWidget {
  const PetListPage({super.key});

  @override
  State<PetListPage> createState() => _PetListPageState();
}

class _PetListPageState extends State<PetListPage> {
  void _addTask() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddTaskPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final taskService = Provider.of<PetConectaService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de pets"),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _addTask, // Adiciona uma nova tarefa
            tooltip: "Adicionar Tarefa",
          ),
        ],
      ),
      body: taskService.tasks.isEmpty
          ? const Center(
              child: Text(
                "Nenhuma tarefa adicionada!",
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
            )
          : ListView.builder(
              itemCount: taskService.tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: taskService
                                .tasks[index]["imageUrl"]?.isNotEmpty ==
                            true
                        ? NetworkImage(taskService.tasks[index]["imageUrl"]!)
                        : null,
                    child:
                        taskService.tasks[index]["imageUrl"]?.isNotEmpty != true
                            ? const Icon(Icons.pets, color: Colors.white)
                            : null,
                  ),
                  title: Text(taskService.tasks[index]["title"]!),
                  subtitle: Text(taskService.tasks[index]["description"]!),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    color: Colors.red,
                    onPressed: () => taskService.removePet(index),
                  ),
                );
              },
            ),
    );
  }
}
