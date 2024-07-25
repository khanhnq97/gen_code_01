import 'package:json_annotation/json_annotation.dart';
import 'keyword_item.dart';

part 'suggest_dictionary.g.dart';

@JsonSerializable()
class SuggestDictionary {
  final String hash;
  final bool updateFlag;
  final List<KeywordItem> keywordItems;

  SuggestDictionary({
    required this.hash,
    required this.updateFlag,
    required this.keywordItems,
  });

  factory SuggestDictionary.fromJson(Map<String, dynamic> json) =>
      _$SuggestDictionaryFromJson(json);

  Map<String, dynamic> toJson() => _$SuggestDictionaryToJson(this);
}