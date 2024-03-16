import 'package:featuremind_assessment/ui/pages/home_page.dart';
import 'package:featuremind_assessment/ui/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Test home page displays as expected", (widgetTester) async {
    await widgetTester.pumpWidget(const ProviderScope(
        child: MaterialApp(
      home: HomePage(),
    )));

    expect(find.text("Home"), findsOneWidget);
    expect(find.byType(SearchWidget), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets(
      "Test error text is displayed when the submit button is tapped without a text in the search widget",
      (widgetTester) async {
    await widgetTester.pumpWidget(const ProviderScope(
        child: MaterialApp(
      home: HomePage(),
    )));

    await widgetTester.tap(find.byType(ElevatedButton));

    await widgetTester.pump();

    expect(find.text("Enter a value"), findsOneWidget);
  });
}
