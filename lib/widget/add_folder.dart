import 'package:flutter/material.dart';

class AddFolder extends StatelessWidget {
  const AddFolder({
    super.key,
    required this.add,
  });

  final void Function(String) add;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.create_new_folder,
        size: 30,
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: const Text(
                'Add Folder',
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
    );
  }
}
