import 'package:flutter/material.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key, required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '$count',
        style: const TextStyle(
          fontSize: 60,
          fontWeight: FontWeight.w500,
          color: Colors.teal,
        ),
      ),
    );
  }
}
