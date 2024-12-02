import 'package:flutter/material.dart';
import 'package:fulltasks/pages/add_task.dart';
import 'package:fulltasks/services/task_service.dart';
import 'package:provider/provider.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  void _addTask() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddTaskPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final taskService = Provider.of<TaskService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de pets"),
        backgroundColor: Colors.deepOrange,
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
                  leading: const Icon(Icons.task_alt),
                  title: Text(taskService.tasks[index]["title"]!),
                  subtitle: Text(taskService.tasks[index]["description"]!),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    color: Colors.red,
                    onPressed: () => taskService.removeTask(index),
                  ),
                );
              },
            ),
    );
  }
}
