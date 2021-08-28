import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_practice_2/app/app.dart';
import 'package:flutter_test_practice_2/screens/home.dart';
import 'package:integration_test/integration_test.dart';

// Run `flutter test integration_test/app_test.dart`

void main() async {
  group('Testing App Performance Tests', () {
    final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized() as IntegrationTestWidgetsFlutterBinding;
    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

    WidgetsFlutterBinding.ensureInitialized();

    testWidgets('Main Test Case', (WidgetTester tester) async {
      // Run app
      await tester.pumpWidget(TestingApp()); // Create main app
      await tester.pumpAndSettle(); // Finish animations and scheduled micro-tasks
      await tester.pump(Duration(seconds: 2)); // Wait some time

      // Enumerate all states that exist in the app just to show we can
      print("All states: ");
      tester.allStates.forEach((s) => print(s));

      // Find
      final Finder item1 = find.byWidgetPredicate((widget) => widget is ItemTile
          && widget.itemNo == 1);

      // Ensure there is a item on the initial page
      expect(item1, findsOneWidget);

      // Tap heart of item 1
      final heartButtonOfItem1 = find.descendant(
        of: item1,
        matching: find.byIcon(Icons.favorite_border),
      );
      await tester.tap(heartButtonOfItem1, warnIfMissed: true);
      await tester.pumpAndSettle();
      await tester.pump(Duration(seconds: 2));

      // Go Favorites Page
      final Finder goFavoritesPageButton = find.byKey(ValueKey('go-favorites-page'));
      await tester.tap(goFavoritesPageButton, warnIfMissed: true);
      await tester.pumpAndSettle();
      await tester.pump(Duration(seconds: 2));

      // Check item is added to favorites
      final Finder item1WithHeart = find.text('Item 1');
      expect(item1WithHeart, findsOneWidget);
      await tester.pump(Duration(seconds: 2));

      // Pop
      NavigatorState navigator = TestingApp.navKey.currentState!;
      navigator.pop();
      await tester.pump(Duration(seconds: 2));
    });

    testWidgets('Scrolling test', (tester) async {
      await tester.pumpWidget(TestingApp());

      final listFinder = find.byType(ListView);

      await binding.watchPerformance(() async {
        await tester.fling(listFinder, Offset(0, -500), 10000);
        await tester.pumpAndSettle();

        await tester.fling(listFinder, Offset(0, 500), 10000);
        await tester.pumpAndSettle();
      }, reportKey: 'scrolling_summary');
    });

    testWidgets('Favorites operations test', (tester) async {
      await tester.pumpWidget(TestingApp());

      final iconKeys = [
        'icon_0',
        'icon_1',
        'icon_2',
      ];

      for (var icon in iconKeys) {
        await tester.tap(find.byKey(ValueKey(icon)));
        await tester.pumpAndSettle(Duration(seconds: 1));

        expect(find.text('Added to favorites.'), findsOneWidget);
      }

      await tester.tap(find.text('Favorites'));
      await tester.pumpAndSettle();

      final removeIconKeys = [
        'remove_icon_0',
        'remove_icon_1',
        'remove_icon_2',
      ];

      for (final iconKey in removeIconKeys) {
        await tester.tap(find.byKey(ValueKey(iconKey)));
        await tester.pumpAndSettle(Duration(seconds: 1));

        expect(find.text('Removed from favorites.'), findsOneWidget);
      }
    });
  });
}