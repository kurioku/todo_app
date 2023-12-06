import 'package:flutter/material.dart';

class AddTodo extends StatelessWidget {
  const AddTodo({
    super.key,
    required this.add,
  });

  final void Function(String) add;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: const Text(
                'Add Todo',
                textAlign: TextAlign.center,
              ),
              content: TextField(
                autofocus: true,
                onSubmitted: (v) {
                  if (v.isNotEmpty) add(v);
                  Navigator.pop(context);
                },
              ),
            );
          },
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
