import 'package:flutter/material.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/todo_list/todo_item.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    super.key,
    required this.todos,
  });

  final List<Todo> todos;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(
          todos[index],
        ),
        child: TodoItem(
          todos[index],
        ),
      ),
    );
  }
}
