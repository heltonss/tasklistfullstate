import 'package:flutter/material.dart';
import 'package:petconecta/components/input_text.dart';
import 'package:petconecta/services/pet_conecta_service.dart';
import 'package:provider/provider.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void _submitTask() {
    String title = _titleController.text.trim();
    String description = _descriptionController.text.trim();

    if (title.isEmpty || description.isEmpty) {
      // Mostra um alerta se os campos estiverem vazios
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Preencha todos os campos!"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    Provider.of<PetConectaService>(context, listen: false)
        .addPet(title, description);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar novo pet"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            InputTextField(
                controller: _titleController, labelText: "Nome do pet"),
            const SizedBox(height: 16),
            InputTextField(
                controller: _descriptionController,
                labelText: "Idade do pet",
                maxLines: 4),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _submitTask,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              child: const Text("Adicionar"),
            ),
          ],
        ),
      ),
    );
  }
}
