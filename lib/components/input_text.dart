import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final int maxLines;

  const InputTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.maxLines = 1, // Padrão é uma linha
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
