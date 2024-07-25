// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_master.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockMaster _$StockMasterFromJson(Map<String, dynamic> json) => StockMaster(
      hash: json['hash'] as String,
      updateFlag: json['updateFlag'] as bool,
      exchangeMap: Map<String, String>.from(json['exchangeMap'] as Map),
      divisionCodeMap: Map<String, String>.from(json['divisionCodeMap'] as Map),
      symbolItems: (json['symbolItems'] as List<dynamic>)
          .map((e) => SymbolItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StockMasterToJson(StockMaster instance) =>
    <String, dynamic>{
      'hash': instance.hash,
      'updateFlag': instance.updateFlag,
      'exchangeMap': instance.exchangeMap,
      'divisionCodeMap': instance.divisionCodeMap,
      'symbolItems': instance.symbolItems.map((e) => e.toJson()).toList(),
    };
