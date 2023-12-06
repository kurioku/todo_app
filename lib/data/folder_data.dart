part 'todo_data.dart';

List<Folder> folders = [];
int selected = 0;
bool editMode = false;

class Folder {
  Folder({
    required this.title,
    required this.todos,
  });

  String title;
  List<Todo> todos;

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'todos': todos.map((t) => t.toJson()).toList(),
    };
  }

  factory Folder.fromJson(Map<String, dynamic> json) {
    return Folder(
      title: json['title'],
      todos: (json['todos'] as List).map((t) => Todo.fromJson(t)).toList(),
    );
  }
}
