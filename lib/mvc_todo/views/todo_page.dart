import 'package:flutter/material.dart';
import 'package:flutter_day_20/mvc_todo/controllers/todo_controller.dart';
import 'package:flutter_day_20/mvc_todo/views/widgets/edit_todo_dialog.dart';
import 'package:intl/intl.dart';

import 'widgets/add_todo_dialog.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final todoController = TodoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MVC Todo"),
        actions: [
          IconButton(
            onPressed: () async {
              Map<String, dynamic>? data = await showDialog(
                context: context,
                builder: (context) {
                  return const AddTodoDialog();
                },
              );

              if (data != null) {
                todoController.addTodo(name: data['title'], date: data['date']);
                setState(() {});
              }
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Finished: ${todoController.finishedTodoCount}',
                  style: const TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Un-finished: ${todoController.unFinishedTodoCount}',
                  style: const TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todoController.todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    todoController.todos[index].title,
                    style: TextStyle(
                      decoration: todoController.todos[index].isDone
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  subtitle: Text(DateFormat('d-MMMM, yyyy')
                      .format(todoController.todos[index].date)),
                  leading: Checkbox(
                    value: todoController.todos[index].isDone,
                    onChanged: (value) {
                      setState(() {
                        todoController.toggleTodo(index);
                      });
                    },
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () async {
                          Map<String, dynamic>? data = await showDialog(
                            context: context,
                            builder: (context) {
                              return const EditTodoDialog();
                            },
                          );

                          if (data != null) {
                            todoController.edit(
                              index: index,
                              newTitle: data['newTitle'],
                              newDate: data['newDate'],
                            );
                            setState(() {});
                          }
                        },
                        icon: const Icon(
                          Icons.mode_edit_outline_outlined,
                          color: Colors.cyan,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            todoController.delete(index);
                          });
                        },
                        icon: const Icon(
                          Icons.delete_outline_rounded,
                          color: Colors.redAccent,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
