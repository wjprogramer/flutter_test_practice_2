import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_practice_2/app/app.dart';
import 'package:integration_test/integration_test.dart';

// Run `flutter test integration_test/app_test.dart`

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  testWidgets('App Test', (WidgetTester tester) async {
    await tester.pumpWidget(TestingApp()); // Create main app
    await tester.pumpAndSettle(); // Finish animations and scheduled micro-tasks
    await tester.pump(Duration(seconds: 2)); // Render another frame in 2s
  });
}