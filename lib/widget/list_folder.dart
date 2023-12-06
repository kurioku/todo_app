import 'package:flutter/material.dart';

import '../data/folder_data.dart';

class ListFolder extends StatelessWidget {
  const ListFolder({
    super.key,
    required this.open,
    required this.edit,
  });

  final void Function(int) open;
  final Function(int) edit;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: folders.length,
      itemBuilder: (_, i) {
        return ListTile(
          selected: i == selected,
          leading: Icon(i == selected ? Icons.folder_open : Icons.folder),
          title: Text(folders[i].title),
          onTap: () {
            if (i != selected) open(i);
            Navigator.pop(context);
          },
          onLongPress: () {
            showDialog(
              context: context,
              builder: (_) => edit(i),
            );
          },
        );
      },
    );
  }
}
