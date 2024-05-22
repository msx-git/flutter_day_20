import 'package:flutter/material.dart';

import '../controllers/counter_controller.dart';
import 'widget/counter_widget.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final counterController = CounterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MVC Counter'),
      ),
      body: CounterWidget(count: counterController.count),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              counterController.decrement();
              setState(() {});
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
            onPressed: () {
              counterController.reset();
              setState(() {});
            },
            child: const Icon(Icons.settings_backup_restore_rounded),
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
            onPressed: () {
              counterController.increment();
              setState(() {});
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
