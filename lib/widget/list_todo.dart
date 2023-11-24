import 'package:flutter/material.dart';

import '../data/file_data.dart';
import '../data/folder_data.dart';

class ListTodo extends StatelessWidget {
  const ListTodo({
    super.key,
    required this.checkTodo,
    required this.dismissTodo,
    required this.editTodo,
  });

  final void Function(int, bool) checkTodo;
  final void Function(int) dismissTodo;
  final Function(int) editTodo;

  @override
  Widget build(BuildContext context) {
    if (!editMode) {
      return ListView.separated(
        itemCount: folders[selectedFolder].todos.length,
        separatorBuilder: (context, index) {
          return const Divider(height: 0);
        },
        itemBuilder: (context, index) {
          return CheckboxListTile(
            value: folders[selectedFolder].todos[index].check,
            onChanged: (value) {
              checkTodo(index, value!);
              save(folders);
            },
            title: Text(folders[selectedFolder].todos[index].title),
          );
        },
      );
    } else {
      return ReorderableListView.builder(
        itemCount: folders[selectedFolder].todos.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: ValueKey(folders[selectedFolder].todos[index]),
            onDismissed: (_) {
              dismissTodo(index);
              save(folders);
            },
            child: ListTile(
              leading: const Icon(Icons.edit),
              title: Text(folders[selectedFolder].todos[index].title),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return editTodo(index);
                  },
                );
              },
            ),
          );
        },
        onReorder: (oldIndex, newIndex) {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          folders[selectedFolder].todos.insert(
                newIndex,
                folders[selectedFolder].todos.removeAt(oldIndex),
              );
          save(folders);
        },
      );
    }
  }
}
