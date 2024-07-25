// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'keyword_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KeywordItem _$KeywordItemFromJson(Map<String, dynamic> json) => KeywordItem(
      symbol: json['symbol'] as String,
      keywordList: (json['keywordList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$KeywordItemToJson(KeywordItem instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'keywordList': instance.keywordList,
    };
