import 'package:flutter/material.dart';

import '../data/data_export.dart';

class EditTodo extends StatelessWidget {
  const EditTodo({
    super.key,
    required this.todoTitle,
    required this.index,
  });

  final void Function(String) todoTitle;
  final int index;

  @override
  Widget build(BuildContext context) {
    final text = TextEditingController(
      text: folders[selectedFolder].todos[index].title,
    );
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
