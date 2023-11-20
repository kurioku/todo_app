part of 'folder_data.dart';

class Todo {
  String title;
  bool check;

  Todo({
    required this.title,
    this.check = false,
  });

  Map toJson() {
    return {
      'title': title,
      'check': check,
    };
  }

  factory Todo.fromJson(Map json) {
    return Todo(
      title: json['title'],
      check: json['check'],
    );
  }
}
