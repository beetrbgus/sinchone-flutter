class Todo {
  final String content;
  final DateTime deadline;

  Todo({
    required this.content,
    required this.deadline,
  });
}

enum Catetory {
  today,
  important,
  planned,
  work,
  ;
}
