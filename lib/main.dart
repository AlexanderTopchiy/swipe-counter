import 'package:flutter/material.dart';
import 'package:swipe_counter/ui/counter_screen.dart';

void main() => runApp(SwipeCounterApp());

class SwipeCounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterScreen(),
    );
  }
}