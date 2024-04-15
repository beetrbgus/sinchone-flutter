import 'package:flutter/material.dart';

class Todo {
  final String content;
  final DateTime deadline;
  final Category category;
  final bool isCompleted;

  Todo({
    required this.content,
    required this.deadline,
    required this.category,
    required this.isCompleted,
  });
}

enum Category {
  today,
  important,
  planned,
  work,
  ;
}

const categoryIconse = {
  Category.today: Icons.today,
  Category.important: Icons.notification_important_rounded,
  Category.planned: Icons.note_alt_sharp,
  Category.work: Icons.work,
};
