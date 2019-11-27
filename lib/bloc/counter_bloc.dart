import 'dart:async';

import 'package:swipe_counter/bloc/base.dart';

class CounterBloc implements Bloc {
  int _count;
  int get currentCount => _count;

  final _counterController = StreamController<int>();

  Stream<int> get counterStream => _counterController.stream;

  void incrementCount() {
    _count += 1;
    _counterController.sink.add(_count);
  }

  void decrementCount() {
    _count - 1 >= 0 ? _count -= 1 : _count = 0;
    _counterController.sink.add(_count);
  }

  void resetCount() {
    _count = 0;
    _counterController.sink.add(_count);
  }

  @override
  void dispose() {
    _counterController.close();
  }
}