import 'package:json_annotation/json_annotation.dart';
import 'symbol_item.dart';

part 'stock_master_response.g.dart';

@JsonSerializable()
class StockMasterResponse {
  final String hash;
  final bool updateFlag;
  final Map<String, String> exchangeMap;
  final Map<String, String> divisionCodeMap;
  final List<SymbolItem> symbolItems;

  StockMasterResponse({
    required this.hash,
    required this.updateFlag,
    required this.exchangeMap,
    required this.divisionCodeMap,
    required this.symbolItems,
  });

  factory StockMasterResponse.fromJson(Map<String, dynamic> json) =>
      _$StockMasterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StockMasterResponseToJson(this);
}