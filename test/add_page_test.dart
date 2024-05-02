import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/pages/add_page.dart';

void main() {
  testWidgets('AddPage should have a title text field', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: AddPage()));

    expect(find.text('Title'), findsOneWidget);
    expect(find.byType(TextFormField), findsOneWidget);
  });

  testWidgets('AddPage should show a snackbar when form is submitted successfully', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: AddPage()));

    await tester.enterText(find.byType(TextFormField), 'Test Title');
    await tester.tap(find.text('Post'));

    await tester.pump();

    expect(find.text('Form Submitted Successfully'), findsOneWidget);
  });
}
