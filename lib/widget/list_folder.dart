import 'package:flutter/material.dart';

import '../data/folder_data.dart';

class ListFolder extends StatelessWidget {
  const ListFolder({
    super.key,
    required this.openFolder,
    required this.editFolder,
  });

  final void Function(int) openFolder;
  final Function(int) editFolder;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: folders.length,
      itemBuilder: (context, index) {
        return ListTile(
          selected: index == selectedFolder,
          leading: Icon(
            index == selectedFolder ? Icons.folder_open : Icons.folder,
          ),
          title: Text(
            folders[index].title,
          ),
          onTap: () {
            if (index != selectedFolder) {
              openFolder(index);
            }
            Navigator.pop(context);
          },
          onLongPress: () {
            showDialog(
              context: context,
              builder: (context) {
                return editFolder(index);
              },
            );
          },
        );
      },
    );
  }
}
