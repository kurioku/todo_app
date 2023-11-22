import 'package:flutter/material.dart';

class AddTodo extends StatelessWidget {
  const AddTodo({
    super.key,
    required this.addTodo,
  });

  final void Function(String) addTodo;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text(
                'Add Todo',
                textAlign: TextAlign.center,
              ),
              content: TextField(
                autofocus: true,
                onSubmitted: (value) {
                  if (value.isNotEmpty) addTodo(value);
                  Navigator.pop(context);
                },
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            );
          },
        );
      },
      child: const Icon(Icons.note_add),
    );
  }
}
