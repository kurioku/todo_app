import 'package:flutter/material.dart';

import '../data/file_data.dart';
import '../data/folder_data.dart';

class ListTodo extends StatelessWidget {
  const ListTodo({
    super.key,
    required this.check,
    required this.dismiss,
    required this.edit,
  });

  final void Function(int, bool) check;
  final void Function(int) dismiss;
  final Function(int) edit;

  @override
  Widget build(BuildContext context) {
    final todos = folders[selected].todos;
    if (!editMode) {
      return ListView.separated(
        itemCount: todos.length,
        separatorBuilder: (_, __) {
          return const Divider(height: 0);
        },
        itemBuilder: (_, i) {
          return CheckboxListTile(
            value: todos[i].check,
            onChanged: (v) {
              check(i, v!);
              save(folders);
            },
            title: Text(todos[i].title),
          );
        },
      );
    } else {
      return ReorderableListView.builder(
        itemCount: todos.length,
        itemBuilder: (_, i) {
          return Dismissible(
            key: ValueKey(todos[i]),
            onDismissed: (_) {
              dismiss(i);
              save(folders);
            },
            child: ListTile(
              leading: const Icon(Icons.edit),
              title: Text(todos[i].title),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => edit(i),
                );
              },
            ),
          );
        },
        onReorder: (last, next) {
          if (last < next) {
            next -= 1;
          }
          todos.insert(next, todos.removeAt(last));
          save(folders);
        },
      );
    }
  }
}
