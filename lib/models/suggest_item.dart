import 'package:json_annotation/json_annotation.dart';
import 'ex_info.dart';

part 'suggest_item.g.dart';

@JsonSerializable()
class SuggestItem {
  final String symbol;
  final String name;
  final String sName;
  final String nameYomi;
  final String nameYomiEn;
  final String category;
  final String mainEx;
  final List<ExInfo> exInfo;
  final List<String> keywordList;

  SuggestItem({
    required this.symbol,
    required this.name,
    required this.sName,
    required this.nameYomi,
    required this.nameYomiEn,
    required this.category,
    required this.mainEx,
    required this.exInfo,
    required this.keywordList,
  });

  factory SuggestItem.fromJson(Map<String, dynamic> json) =>
      _$SuggestItemFromJson(json);

  Map<String, dynamic> toJson() => _$SuggestItemToJson(this);
}