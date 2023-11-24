import 'package:flutter/material.dart';

class AddFolder extends StatelessWidget {
  const AddFolder({
    super.key,
    required this.addFolder,
  });

  final void Function(String) addFolder;

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
          builder: (context) {
            return AlertDialog(
              title: const Text(
                'Add Folder',
                textAlign: TextAlign.center,
              ),
              content: TextField(
                autofocus: true,
                onSubmitted: (value) {
                  if (value.isNotEmpty) addFolder(value);
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
