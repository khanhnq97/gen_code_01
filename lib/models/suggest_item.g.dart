// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggest_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuggestItem _$SuggestItemFromJson(Map<String, dynamic> json) => SuggestItem(
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      sName: json['sName'] as String,
      nameYomi: json['nameYomi'] as String,
      nameYomiEn: json['nameYomiEn'] as String,
      category: json['category'] as String,
      mainEx: json['mainEx'] as String,
      exInfo: (json['exInfo'] as List<dynamic>)
          .map((e) => ExInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      keywordList: (json['keywordList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$SuggestItemToJson(SuggestItem instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'name': instance.name,
      'sName': instance.sName,
      'nameYomi': instance.nameYomi,
      'nameYomiEn': instance.nameYomiEn,
      'category': instance.category,
      'mainEx': instance.mainEx,
      'exInfo': instance.exInfo.map((e) => e.toJson()).toList(),
      'keywordList': instance.keywordList,
    };
