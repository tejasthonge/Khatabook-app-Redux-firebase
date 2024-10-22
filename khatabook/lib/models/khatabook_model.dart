


import 'package:json_annotation/json_annotation.dart';
part 'khatabook_model.g.dart';


@JsonSerializable()
class KhatabookModel { 

  String? customerName;
  double? givenMoneyAmount;
  double? takenMoneyAmount;
  int? mobileNumber;

  KhatabookModel(
    {this.customerName,
    this.givenMoneyAmount,
    this.takenMoneyAmount,
    this.mobileNumber,});
  
  factory KhatabookModel.fromJson(Map<String, dynamic> json) => _$KhatabookModelFromJson(json);
  
  Map<String, dynamic> toJson() => _$KhatabookModelToJson(this);

}