import 'package:flutter/material.dart';

import '/data/data_export.dart';

class EditFolder extends StatelessWidget {
  const EditFolder({
    super.key,
    required this.folderTitle,
    required this.deleteFolder,
    required this.index,
  });

  final void Function(String) folderTitle;
  final void Function() deleteFolder;
  final int index;

  @override
  Widget build(BuildContext context) {
    final text = TextEditingController(text: folders[index].title);
    return AlertDialog(
      title: const Text(
        'Edit Folder',
        textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (selectedFolder > index ||
                selectedFolder == folders.length - 1 && folders.length > 1) {
              selectedFolder--;
            }
            deleteFolder();
          },
          child: const Text(
            'Delete Folder',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
      content: TextField(
        autofocus: true,
        controller: text,
        onSubmitted: (value) {
          if (value.isNotEmpty) {
            folderTitle(value);
          }
          Navigator.pop(context);
        },
      ),
    );
  }
}
