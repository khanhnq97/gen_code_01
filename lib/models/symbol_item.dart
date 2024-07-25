import 'package:json_annotation/json_annotation.dart';
import 'ex_info.dart';

part 'symbol_item.g.dart';

@JsonSerializable()
class SymbolItem {
  final String symbol;
  final String name;
  final String sName;
  final String nameYomi;
  final String nameYomiEn;
  final String category;
  final String mainEx;
  final List<ExInfo> exInfo;

  SymbolItem({
    required this.symbol,
    required this.name,
    required this.sName,
    required this.nameYomi,
    required this.nameYomiEn,
    required this.category,
    required this.mainEx,
    required this.exInfo,
  });

  factory SymbolItem.fromJson(Map<String, dynamic> json) =>
      _$SymbolItemFromJson(json);

  Map<String, dynamic> toJson() => _$SymbolItemToJson(this);
}