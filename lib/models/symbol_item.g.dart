// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'symbol_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SymbolItem _$SymbolItemFromJson(Map<String, dynamic> json) => SymbolItem(
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
    );

Map<String, dynamic> _$SymbolItemToJson(SymbolItem instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'name': instance.name,
      'sName': instance.sName,
      'nameYomi': instance.nameYomi,
      'nameYomiEn': instance.nameYomiEn,
      'category': instance.category,
      'mainEx': instance.mainEx,
      'exInfo': instance.exInfo.map((e) => e.toJson()).toList(),
    };
