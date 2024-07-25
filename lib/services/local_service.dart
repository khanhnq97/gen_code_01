import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:suggest_cache_demo/models/suggest_item.dart';

class LocalService {
  static const String _stockMasterKey = 'stock_master';
  static const String _suggestDictionaryKey = 'suggest_dictionary';
  static const String _stockMasterHashKey = 'stock_master_hash';
  static const String _suggestHashKey = 'suggest_hash';
  static const String _suggestCacheKey = 'suggest_cache';

  Future<SharedPreferences> get _prefs => SharedPreferences.getInstance();

  Future<void> saveStockMaster(String data) async {
    final prefs = await _prefs;
    await prefs.setString(_stockMasterKey, data);
  }

  Future<String?> getStockMaster() async {
    final prefs = await _prefs;
    return prefs.getString(_stockMasterKey);
  }

  Future<void> saveSuggestDictionary(String data) async {
    final prefs = await _prefs;
    await prefs.setString(_suggestDictionaryKey, data);
  }

  Future<String?> getSuggestDictionary() async {
    final prefs = await _prefs;
    return prefs.getString(_suggestDictionaryKey);
  }

  Future<void> saveStockMasterHash(String hash) async {
    final prefs = await _prefs;
    await prefs.setString(_stockMasterHashKey, hash);
  }

  Future<String?> getStockMasterHash() async {
    final prefs = await _prefs;
    return prefs.getString(_stockMasterHashKey);
  }

  Future<void> saveSuggestHash(String hash) async {
    final prefs = await _prefs;
    await prefs.setString(_suggestHashKey, hash);
  }

  Future<String?> getSuggestHash() async {
    final prefs = await _prefs;
    return prefs.getString(_suggestHashKey);
  }

  Future<void> saveSuggestCache(List<SuggestItem> suggestCache) async {
    final prefs = await _prefs;
    final jsonString =
        json.encode(suggestCache.map((e) => e.toJson()).toList());
    await prefs.setString(_suggestCacheKey, jsonString);
  }

  Future<List<SuggestItem>?> getSuggestCache() async {
    final prefs = await _prefs;
    final jsonString = prefs.getString(_suggestCacheKey);
    if (jsonString != null) {
      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((e) => SuggestItem.fromJson(e)).toList();
    }
    return null;
  }
}
