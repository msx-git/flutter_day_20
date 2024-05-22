import '../models/todo_model.dart';

class TodoController {
  final List<Todo> _todos = [
    Todo(
      title: 'Finish homework',
      date: DateTime(2024, 05, 23),
    ),
    Todo(title: 'Finish project', date: DateTime(2024, 07, 15), isDone: true),
    Todo(title: 'Do podcast today', date: DateTime(2024, 07, 15)),
  ];

  List<Todo> get todos => [..._todos];

  int get finishedTodoCount => _todos.where((todo) => todo.isDone).length;

  int get unFinishedTodoCount => _todos.length - finishedTodoCount;

  void addTodo({required String name, required DateTime date}) {
    _todos.add(Todo(title: name, date: date));
  }

  void delete(int index) {
    _todos.removeAt(index);
  }

  void edit({
    required int index,
    required String newTitle,
    required DateTime newDate,
  }) {
    _todos[index].title = newTitle;
    _todos[index].date = newDate;
  }

  void toggleTodo(int index) {
    _todos[index].isDone = !_todos[index].isDone;
  }
}
