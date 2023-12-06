part of 'folder_data.dart';

class Todo {
  Todo({
    required this.title,
    this.check = false,
  });

  String title;
  bool check;

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'check': check,
    };
  }

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      title: json['title'],
      check: json['check'],
    );
  }
}
