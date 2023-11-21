part 'todo_data.dart';

List<Folder> folders = [];
int selectedFolder = 0;
bool editMode = false;

class Folder {
  Folder({
    required this.title,
    required this.todos,
  });

  late final String title;
  final List<Todo> todos;

  Map toJson() {
    return {
      'title': title,
      'todos': todos.map((t) => t.toJson()).toList(),
    };
  }

  factory Folder.fromJson(Map json) {
    return Folder(
      title: json['title'],
      todos: (json['todos'] as List).map((t) => Todo.fromJson(t)).toList(),
    );
  }
}
