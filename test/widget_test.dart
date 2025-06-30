// ...existing code...

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:portfolio/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // ...existing code...
    await tester.pumpWidget(const MyApp());

    // ...existing code...
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // ...existing code...
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // ...existing code...
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
