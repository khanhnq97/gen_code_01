// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggest_dictionary_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuggestDictionaryResponse _$SuggestDictionaryResponseFromJson(
        Map<String, dynamic> json) =>
    SuggestDictionaryResponse(
      hash: json['hash'] as String,
      updateFlag: json['updateFlag'] as bool,
      keywordItems: (json['keywordItems'] as List<dynamic>)
          .map((e) => KeywordItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SuggestDictionaryResponseToJson(
        SuggestDictionaryResponse instance) =>
    <String, dynamic>{
      'hash': instance.hash,
      'updateFlag': instance.updateFlag,
      'keywordItems': instance.keywordItems.map((e) => e.toJson()).toList(),
    };
