import 'package:flutter/material.dart';

class EditTodo extends StatelessWidget {
  const EditTodo({
    super.key,
    required this.todoTitle,
    required this.title,
  });

  final void Function(String) todoTitle;
  final String title;

  @override
  Widget build(BuildContext context) {
    final text = TextEditingController(text: title);
    return AlertDialog(
      title: const Text(
        'Edit Todo',
        textAlign: TextAlign.center,
      ),
      content: TextField(
        autofocus: true,
        controller: text,
        onSubmitted: (value) {
          if (value.isNotEmpty) {
            todoTitle(value);
          }
          Navigator.pop(context);
        },
      ),
    );
  }
}
