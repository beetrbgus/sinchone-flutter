import 'package:flutter/material.dart';
import 'package:todo/models/todo.dart';

class TodoItem extends StatelessWidget {
  const TodoItem(
    this.todo, {
    super.key,
  });

  final Todo todo;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            child: Column(
              children: [
                Text(todo.content),
              ],
            ),
          )
        ],
      ),
    );
  }
}
