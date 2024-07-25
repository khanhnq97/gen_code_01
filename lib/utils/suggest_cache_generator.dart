import 'dart:convert';
import 'package:suggest_cache_demo/models/keyword_item.dart';
import 'package:suggest_cache_demo/models/stock_master_response.dart';
import 'package:suggest_cache_demo/models/suggest_dictionary_response.dart';

import '../models/stock_master.dart';
import '../models/suggest_dictionary.dart';
import '../models/suggest_item.dart';
import '../services/local_service.dart';
import '../services/api_service.dart';

class SuggestCacheGenerator {
  final LocalService _localService;
  final ApiService _apiService;

  SuggestCacheGenerator(this._localService, this._apiService);

  Future<void> generateSuggestCache() async {
    await _processStockMaster();
    await _processSuggestDictionary();
    await _createSuggestCache();
  }

  Future<void> _processStockMaster() async {
    final storedHash = await _localService.getStockMasterHash();
    final response = await _apiService.getStockMaster(storedHash);

    if (response.statusCode == 200) {
      final stockMasterResponse =
          StockMasterResponse.fromJson(json.decode(response.body));
      if (stockMasterResponse.updateFlag) {
        await _localService.saveStockMaster(response.body);
        await _localService.saveStockMasterHash(stockMasterResponse.hash);
      }
    } else if (response.statusCode != 304) {
      // Handle error
      print('Error fetching stock master: ${response.statusCode}');
    }
  }

  Future<void> _processSuggestDictionary() async {
    final storedHash = await _localService.getSuggestHash();
    final response = await _apiService.getSuggestDictionary(storedHash);

    if (response.statusCode == 200) {
      final suggestDictionaryResponse =
          SuggestDictionaryResponse.fromJson(json.decode(response.body));
      if (suggestDictionaryResponse.updateFlag) {
        await _localService.saveSuggestDictionary(response.body);
        await _localService.saveSuggestHash(suggestDictionaryResponse.hash);
      }
    } else if (response.statusCode != 304) {
      // Continue processing even if there's an error
      print('Error fetching suggest dictionary: ${response.statusCode}');
    }
  }

  Future<void> _createSuggestCache() async {
    final stockMasterJson = await _localService.getStockMaster();
    final suggestDictionaryJson = await _localService.getSuggestDictionary();

    if (stockMasterJson != null && suggestDictionaryJson != null) {
      final stockMaster = StockMaster.fromJson(json.decode(stockMasterJson));
      final suggestDictionary =
          SuggestDictionary.fromJson(json.decode(suggestDictionaryJson));

      final suggestCache = _mergeSuggestCache(stockMaster, suggestDictionary);
      await _localService.saveSuggestCache(suggestCache);
    }
  }

  List<SuggestItem> _mergeSuggestCache(
      StockMaster stockMaster, SuggestDictionary suggestDictionary) {
    final Map<String, KeywordItem> keywordMap = {
      for (var item in suggestDictionary.keywordItems) item.symbol: item
    };

    return stockMaster.symbolItems.map((symbolItem) {
      final keywordItem = keywordMap[symbolItem.symbol];
      return SuggestItem(
        symbol: symbolItem.symbol,
        name: symbolItem.name,
        sName: symbolItem.sName,
        nameYomi: symbolItem.nameYomi,
        nameYomiEn: symbolItem.nameYomiEn,
        category: symbolItem.category,
        mainEx: symbolItem.mainEx,
        exInfo: symbolItem.exInfo,
        keywordList: keywordItem?.keywordList ?? [],
      );
    }).toList();
  }
}
