import 'package:flutter/material.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/todo_list/todo_item.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    super.key,
    required this.expenses,
  });

  final List<Todo> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(
          expenses[index],
        ),
        child: TodoItem(
          expenses[index],
        ),
      ),
    );
  }
}
