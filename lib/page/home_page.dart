import 'package:flutter/material.dart';

import '../data/file_data.dart';
import '../data/folder_data.dart';
import '../widget/export.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: folders.isEmpty
          ? AppBar()
          : AppBar(
              title: Text(folders[selected].title),
              actions: [
                IconButton(
                  icon: editMode
                      ? const Opacity(
                          opacity: 0.5,
                          child: Icon(Icons.edit_square),
                        )
                      : const Icon(Icons.edit_square),
                  onPressed: () {
                    setState(() {
                      editMode = !editMode;
                    });
                  },
                ),
              ],
            ),
      drawer: Drawer(
        width: 200,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AddFolder(
                add: (title) {
                  setState(() {
                    folders.add(Folder(title: title, todos: []));
                  });
                  save(folders);
                },
              ),
              const Divider(height: 15),
              ListFolder(
                open: (i) {
                  setState(() {
                    selected = i;
                  });
                },
                edit: (i) {
                  return EditFolder(
                    i: i,
                    delete: () {
                      setState(() {
                        folders.removeAt(i);
                      });
                    },
                    title: (title) {
                      setState(() {
                        folders[i].title = title;
                      });
                      save(folders);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: Visibility(
        visible: folders.isNotEmpty,
        child: ListTodo(
          check: (i, v) {
            setState(() {
              folders[selected].todos[i].check = v;
            });
          },
          dismiss: (i) {
            setState(() {
              folders[selected].todos.removeAt(i);
            });
          },
          edit: (i) {
            return EditTodo(
              i: i,
              title: (v) {
                setState(() {
                  folders[selected].todos[i].title = v;
                });
                save(folders);
              },
            );
          },
        ),
      ),
      floatingActionButton: Visibility(
        visible: folders.isNotEmpty & !editMode,
        child: AddTodo(
          add: (v) {
            setState(() {
              folders[selected].todos.add(Todo(title: v));
            });
            save(folders);
          },
        ),
      ),
    );
  }
}
