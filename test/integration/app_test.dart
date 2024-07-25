import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:suggest_cache_demo/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tap on the floating action button, verify cache generation',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Verify that our counter starts at 0.
      expect(find.text('Suggest Cache'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      // Wait for initial data to load (if any)
      await tester.pumpAndSettle(Duration(seconds: 5));

      // Tap the floating action button.
      await tester.tap(find.byType(FloatingActionButton));

      // Wait for cache generation and UI update
      await tester.pumpAndSettle(Duration(seconds: 10));

      // Verify that we're no longer showing a loading indicator
      expect(find.byType(CircularProgressIndicator), findsNothing);

      // Verify that we have some data
      expect(find.byType(ListTile), findsWidgets);

      // Verify the first item in the list (this will depend on your actual data)
      expect(find.text('SomeSymbol'), findsOneWidget);
      expect(find.text('Some Company Name'), findsOneWidget);

      // Scroll the list
      await tester.fling(find.byType(ListView), Offset(0, -200), 3000);
      await tester.pumpAndSettle();

      // Verify that we can see a different item after scrolling
      expect(find.text('AnotherSymbol'), findsOneWidget);

      // Pull to refresh (if implemented)
      await tester.fling(find.byType(ListView), Offset(0, 300), 1000);
      await tester.pumpAndSettle();

      // Verify that the refresh indicator is shown
      expect(find.byType(RefreshProgressIndicator), findsOneWidget);

      // Wait for refresh to complete
      await tester.pumpAndSettle(Duration(seconds: 5));

      // Verify that the refresh indicator is gone
      expect(find.byType(RefreshProgressIndicator), findsNothing);

      // Verify that we still have data
      expect(find.byType(ListTile), findsWidgets);
    });
  });
}
