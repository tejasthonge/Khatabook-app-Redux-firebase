// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'khatabook_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KhatabookModel _$KhatabookModelFromJson(Map<String, dynamic> json) =>
    KhatabookModel(
      customerName: json['customerName'] as String?,
      givenMoneyAmount: (json['givenMoneyAmount'] as num?)?.toDouble(),
      takenMoneyAmount: (json['takenMoneyAmount'] as num?)?.toDouble(),
      mobileNumber: (json['mobileNumber'] as num?)?.toInt(),
    );

Map<String, dynamic> _$KhatabookModelToJson(KhatabookModel instance) =>
    <String, dynamic>{
      'customerName': instance.customerName,
      'givenMoneyAmount': instance.givenMoneyAmount,
      'takenMoneyAmount': instance.takenMoneyAmount,
      'mobileNumber': instance.mobileNumber,
    };
