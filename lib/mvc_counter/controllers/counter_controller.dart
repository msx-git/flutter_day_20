
import '../models/counter_model.dart';

class CounterController {
  final counter = Counter(0);

  int get count => counter.count;

  void increment() => counter.count++;

  void decrement() => counter.count--;

  void reset() => counter.count = 0;
}
