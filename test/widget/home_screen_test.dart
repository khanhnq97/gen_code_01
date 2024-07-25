import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'package:suggest_cache_demo/models/suggest_item.dart';
import 'package:suggest_cache_demo/providers/suggest_cache_provider.dart';
import 'package:suggest_cache_demo/screens/home_screen.dart';
import 'package:suggest_cache_demo/utils/suggest_cache_generator.dart';
import 'package:suggest_cache_demo/services/local_service.dart';

import 'home_screen_test.mocks.dart';

@GenerateMocks([SuggestCacheGenerator, LocalService])
void main() {
  late MockSuggestCacheGenerator mockSuggestCacheGenerator;
  late MockLocalService mockLocalService;

  setUp(() {
    mockSuggestCacheGenerator = MockSuggestCacheGenerator();
    mockLocalService = MockLocalService();
  });

  testWidgets('HomeScreen displays loading indicator when loading',
      (WidgetTester tester) async {
    final mockProvider = StateNotifierProvider<SuggestCacheNotifier,
        AsyncValue<List<SuggestItem>>>(
      (ref) =>
          SuggestCacheNotifier(mockSuggestCacheGenerator, mockLocalService),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          suggestCacheProvider.overrideWithProvider(mockProvider),
        ],
        child: MaterialApp(home: HomeScreen()),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  // Add more widget tests for different states (data loaded, error)
  testWidgets('HomeScreen displays data when loaded',
      (WidgetTester tester) async {
    final mockItems = [
      SuggestItem(
        symbol: 'AAPL',
        name: 'Apple Inc.',
        sName: 'Apple',
        nameYomi: 'アップル',
        nameYomiEn: 'appuru',
        category: 'Technology',
        mainEx: 'NASDAQ',
        exInfo: [],
        keywordList: ['iPhone', 'Mac', 'iPad'],
      ),
    ];

    when(mockLocalService.getSuggestCache()).thenAnswer((_) async => mockItems);

    final mockProvider = StateNotifierProvider<SuggestCacheNotifier,
        AsyncValue<List<SuggestItem>>>(
      (ref) =>
          SuggestCacheNotifier(mockSuggestCacheGenerator, mockLocalService),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          suggestCacheProvider.overrideWithProvider(mockProvider),
        ],
        child: MaterialApp(home: HomeScreen()),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Apple Inc.'), findsOneWidget);
    expect(find.text('AAPL'), findsOneWidget);
  });
}
