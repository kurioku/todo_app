import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'dart:io';

import 'folder_data.dart';

Future<void> save(List<Folder> folder) async {
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/list.json');

  final jsonList = folder.map((f) => f.toJson()).toList();
  final jsonString = jsonEncode(jsonList);
  await file.writeAsString(jsonString);
}

Future<List<Folder>> load() async {
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/list.json');

  if (await file.exists()) {
    final jsonString = await file.readAsString();
    final List jsonList = jsonDecode(jsonString);
    return jsonList.map((f) => Folder.fromJson(f)).toList();
  }

  return [];
}
