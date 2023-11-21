import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../data/data_export.dart';

class EditTodo extends HookWidget {
  const EditTodo({
    super.key,
    required this.todoTitle,
    required this.index,
  });

  final void Function(String) todoTitle;
  final int index;

  @override
  Widget build(BuildContext context) {
    final text = useTextEditingController(
        text: folders[selectedFolder].todos[index].title);
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
