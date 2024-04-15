import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/models/todo.dart';

final dateformatter = DateFormat("yyyy-MM-dd");

class TodoItem extends StatelessWidget {
  const TodoItem(
    this.todo, {
    super.key,
    required this.onTodoComplete,
  });
  final bool _isChekced = false;
  final Todo todo;
  final Function(Todo) onTodoComplete;

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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      value: _isChekced,
                      onChanged: (value) {
                        onTodoComplete(todo);
                      },
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(todo.content),
                        Text(todo.category.name),
                      ],
                    ),
                  ],
                ),
                Text(dateformatter.format(todo.deadline)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
