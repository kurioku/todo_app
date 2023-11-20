import 'package:flutter/material.dart';

import '/data/data_export.dart';
import '/widget/widget_export.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    _initLoad();
  }

  Future<void> _initLoad() async {
    folders = await load();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: folders.isEmpty
            ? AppBar()
            : AppBar(
                title: Text(folders[selectedFolder].title),
                actions: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        editMode = !editMode;
                      });
                    },
                    icon: editMode
                        ? const Opacity(
                            opacity: 0.5,
                            child: Icon(
                              Icons.edit_square,
                            ),
                          )
                        : const Icon(Icons.edit_square),
                  ),
                ],
              ),
        drawer: Drawer(
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AddFolder(
                addFolder: (title) {
                  setState(() {
                    folders.add(Folder(title: title, todos: []));
                  });
                  save(folders);
                },
              ),
              const Divider(),
              ListFolder(
                openFolder: (index) {
                  setState(() {
                    selectedFolder = index;
                  });
                },
                editFolder: (index) {
                  return EditFolder(
                    index: index,
                    title: folders[index].title,
                    deleteFolder: () {
                      setState(() {
                        folders.removeAt(index);
                      });
                      save(folders);
                      Navigator.pop(context);
                    },
                    folderTitle: (title) {
                      setState(() {
                        folders[index].title = title;
                      });
                      save(folders);
                    },
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: Visibility(
          visible: folders.isNotEmpty & !editMode,
          child: AddTodo(
            addTodo: (title) {
              setState(() {
                folders[selectedFolder].todos.add(Todo(title: title));
              });
              save(folders);
            },
          ),
        ),
        body: Visibility(
          visible: folders.isNotEmpty,
          child: ListTodo(
            checkTodo: (index, value) {
              setState(() {
                folders[selectedFolder].todos[index].check = value;
              });
              save(folders);
            },
            dismissTodo: (index) {
              setState(() {
                folders[selectedFolder].todos.removeAt(index);
              });
              save(folders);
            },
            editTodo: (index) {
              return EditTodo(
                title: folders[selectedFolder].todos[index].title,
                todoTitle: (title) {
                  setState(() {
                    folders[selectedFolder].todos[index].title = title;
                  });
                  save(folders);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
