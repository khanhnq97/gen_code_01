// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggest_dictionary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuggestDictionary _$SuggestDictionaryFromJson(Map<String, dynamic> json) =>
    SuggestDictionary(
      hash: json['hash'] as String,
      updateFlag: json['updateFlag'] as bool,
      keywordItems: (json['keywordItems'] as List<dynamic>)
          .map((e) => KeywordItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SuggestDictionaryToJson(SuggestDictionary instance) =>
    <String, dynamic>{
      'hash': instance.hash,
      'updateFlag': instance.updateFlag,
      'keywordItems': instance.keywordItems.map((e) => e.toJson()).toList(),
    };
