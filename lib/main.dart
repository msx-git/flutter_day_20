import 'package:flutter/material.dart';
import 'package:flutter_day_20/mvc_phonebook/views/phonebook_page.dart';
import 'package:flutter_day_20/mvc_todo/views/todo_page.dart';

import 'mvc_counter/views/counter_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PageView(
        children: [
          TodoPage(),
          PhonebookPage(),
          CounterPage(),
        ],
      ),
    );
  }
}
