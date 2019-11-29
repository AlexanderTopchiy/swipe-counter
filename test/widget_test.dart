import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:swipe_counter/ui/counter_screen.dart';

void main() {
  testWidgets('Counter increments test', (WidgetTester tester) async {
    await tester.pumpWidget(CounterScreen());

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    await tester.fling(find.byType(Dismissible), Offset(200, 0), 1000);
    await tester.pumpAndSettle();
    
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
