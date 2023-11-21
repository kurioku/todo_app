part of 'folder_data.dart';

class Todo {
  Todo({
    required this.title,
    this.check = false,
  });

  late final String title;
  bool check;

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
