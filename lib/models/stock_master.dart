import 'package:json_annotation/json_annotation.dart';
import 'symbol_item.dart';

part 'stock_master.g.dart';

@JsonSerializable()
class StockMaster {
  final String hash;
  final bool updateFlag;
  final Map<String, String> exchangeMap;
  final Map<String, String> divisionCodeMap;
  final List<SymbolItem> symbolItems;

  StockMaster({
    required this.hash,
    required this.updateFlag,
    required this.exchangeMap,
    required this.divisionCodeMap,
    required this.symbolItems,
  });

  factory StockMaster.fromJson(Map<String, dynamic> json) =>
      _$StockMasterFromJson(json);

  Map<String, dynamic> toJson() => _$StockMasterToJson(this);
}