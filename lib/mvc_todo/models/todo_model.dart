class Todo {
  String title;
  DateTime date;
  bool isDone;

  Todo({
    required this.title,
    required this.date,
    this.isDone = false,
  });
}
