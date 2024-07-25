import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/suggest_item.dart';
import '../utils/suggest_cache_generator.dart';
import '../services/local_service.dart';
import '../services/api_service.dart';

final suggestCacheProvider =
    StateNotifierProvider<SuggestCacheNotifier, AsyncValue<List<SuggestItem>>>(
        (ref) {
  final localService = LocalService();
  final apiService = ApiService(
    baseUrl: 'https://api.example.com',
    useMockData: true,
  );
  final suggestCacheGenerator = SuggestCacheGenerator(localService, apiService);
  return SuggestCacheNotifier(suggestCacheGenerator, localService);
});

class SuggestCacheNotifier
    extends StateNotifier<AsyncValue<List<SuggestItem>>> {
  final SuggestCacheGenerator _suggestCacheGenerator;
  final LocalService _localService;

  SuggestCacheNotifier(this._suggestCacheGenerator, this._localService)
      : super(AsyncValue.loading()) {
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    final cachedData = await _localService.getSuggestCache();
    if (cachedData != null) {
      state = AsyncValue.data(cachedData);
    } else {
      await generateSuggestCache();
    }
  }

  Future<void> generateSuggestCache() async {
    state = AsyncValue.loading();
    try {
      await _suggestCacheGenerator.generateSuggestCache();
      final updatedCache = await _localService.getSuggestCache();
      if (updatedCache != null) {
        state = AsyncValue.data(updatedCache);
      } else {
        state = AsyncValue.error(
            'Failed to generate suggest cache', StackTrace.current);
      }
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}
