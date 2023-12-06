import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../data/folder_data.dart';

class EditTodo extends HookWidget {
  const EditTodo({
    super.key,
    required this.title,
    required this.i,
  });

  final void Function(String) title;
  final int i;

  @override
  Widget build(BuildContext context) {
    final todo = folders[selected].todos[i];
    final text = useTextEditingController(text: todo.title);
    return AlertDialog(
      title: const Text(
        'Edit Todo',
        textAlign: TextAlign.center,
      ),
      content: TextField(
        autofocus: true,
        controller: text,
        onSubmitted: (v) {
          if (v != todo.title) title(v);
          Navigator.pop(context);
        },
      ),
    );
  }
}
