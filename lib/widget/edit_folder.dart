import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../data/file_data.dart';
import '../data/folder_data.dart';

class EditFolder extends HookWidget {
  const EditFolder({
    super.key,
    required this.title,
    required this.delete,
    required this.i,
  });

  final void Function(String) title;
  final void Function() delete;
  final int i;

  @override
  Widget build(BuildContext context) {
    final folder = folders[i];
    final text = useTextEditingController(text: folder.title);
    return AlertDialog(
      title: const Text(
        'Edit Folder',
        textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (selected > i ||
                selected == folders.length - 1 && folders.length > 1) {
              selected--;
            }
            delete();
            save(folders);
            Navigator.pop(context);
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
        onSubmitted: (v) {
          if (v != folder.title) title(v);
          Navigator.pop(context);
        },
      ),
    );
  }
}
