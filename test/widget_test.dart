import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Smoke test', (WidgetTester tester) async {
//  await tester.pumpWidget(MyApp());
    expect(find.text('User name:'), findsOneWidget);

    await tester.tap(find.text('Validate'));
    await tester.pump();

    expect(find.text('Field should be filled'), findsOneWidget);
  });
}