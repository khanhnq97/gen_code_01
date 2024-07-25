import 'package:json_annotation/json_annotation.dart';

part 'keyword_item.g.dart';

@JsonSerializable()
class KeywordItem {
  final String symbol;
  final List<String> keywordList;

  KeywordItem({
    required this.symbol,
    required this.keywordList,
  });

  factory KeywordItem.fromJson(Map<String, dynamic> json) =>
      _$KeywordItemFromJson(json);

  Map<String, dynamic> toJson() => _$KeywordItemToJson(this);
}
