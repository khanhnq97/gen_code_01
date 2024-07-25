import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:suggest_cache_demo/services/api_service.dart';
import 'package:suggest_cache_demo/services/local_service.dart';
import 'package:suggest_cache_demo/utils/suggest_cache_generator.dart';

import 'suggest_cache_generator_test.mocks.dart';

@GenerateMocks([LocalService, ApiService])
void main() {
  late SuggestCacheGenerator suggestCacheGenerator;
  late MockLocalService mockLocalService;
  late MockApiService mockApiService;

  setUp(() {
    mockLocalService = MockLocalService();
    mockApiService = MockApiService();
    suggestCacheGenerator =
        SuggestCacheGenerator(mockLocalService, mockApiService);
  });

  test(
      'generateSuggestCache should process stock master and suggest dictionary',
      () async {
    // Setup mock responses
    when(mockLocalService.getStockMasterHash())
        .thenAnswer((_) async => 'old_hash');
    when(mockLocalService.getSuggestHash()).thenAnswer((_) async => 'old_hash');
    when(mockApiService.getStockMaster(any)).thenAnswer((_) async =>
        http.Response('{"hash": "new_hash", "updateFlag": true}', 200));
    when(mockApiService.getSuggestDictionary(any)).thenAnswer((_) async =>
        http.Response('{"hash": "new_hash", "updateFlag": true}', 200));

    // Call the method
    await suggestCacheGenerator.generateSuggestCache();

    // Verify interactions
    verify(mockLocalService.getStockMasterHash()).called(1);
    verify(mockLocalService.getSuggestHash()).called(1);
    verify(mockApiService.getStockMaster('old_hash')).called(1);
    verify(mockApiService.getSuggestDictionary('old_hash')).called(1);
    verify(mockLocalService.saveStockMaster(argThat(isA<String>()))).called(1);
    verify(mockLocalService.saveSuggestDictionary(argThat(isA<String>())))
        .called(1);
    verify(mockLocalService.saveStockMasterHash('new_hash')).called(1);
    verify(mockLocalService.saveSuggestHash('new_hash')).called(1);
  });
}
