import 'package:json_annotation/json_annotation.dart';
import 'keyword_item.dart';

part 'suggest_dictionary_response.g.dart';

@JsonSerializable()
class SuggestDictionaryResponse {
  final String hash;
  final bool updateFlag;
  final List<KeywordItem> keywordItems;

  SuggestDictionaryResponse({
    required this.hash,
    required this.updateFlag,
    required this.keywordItems,
  });

  factory SuggestDictionaryResponse.fromJson(Map<String, dynamic> json) =>
      _$SuggestDictionaryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SuggestDictionaryResponseToJson(this);
}