import 'package:json_annotation/json_annotation.dart';

part 'ex_info.g.dart';

@JsonSerializable()
class ExInfo {
  final String ex;
  final String div;
  final String exName;

  ExInfo({
    required this.ex,
    required this.div,
    required this.exName,
  });

  factory ExInfo.fromJson(Map<String, dynamic> json) => _$ExInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ExInfoToJson(this);
}
