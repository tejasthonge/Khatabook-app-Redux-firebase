




import 'package:json_annotation/json_annotation.dart';

part 'session_model.g.dart';
@JsonSerializable()
class BossModel{

  String? lable;
  String? value;

  BossModel({required this.lable, required this.value});

  factory BossModel.fromJson(Map<String, dynamic> json) => _$BossModelFromJson(json);
  Map<String, dynamic> toJson() => _$BossModelToJson(this);
}