// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model_freezed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      success: json['success'] as bool? ?? false,
      accounts: (json['accounts'] as List<dynamic>?)
              ?.map((e) => Accounts.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'accounts': instance.accounts,
    };

_$_Accounts _$$_AccountsFromJson(Map<String, dynamic> json) => _$_Accounts(
      type: json['type'] as String? ?? "",
      number: json['number'] as String? ?? "",
      primary: json['primary'] as String? ?? "",
    );

Map<String, dynamic> _$$_AccountsToJson(_$_Accounts instance) =>
    <String, dynamic>{
      'type': instance.type,
      'number': instance.number,
      'primary': instance.primary,
    };
