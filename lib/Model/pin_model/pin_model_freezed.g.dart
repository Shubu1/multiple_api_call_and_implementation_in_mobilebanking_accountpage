// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pin_model_freezed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PinModel _$$_PinModelFromJson(Map<String, dynamic> json) => _$_PinModel(
      success: json['success'] as bool? ?? false,
      options: (json['options'] as List<dynamic>?)
              ?.map((e) => Options.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_PinModelToJson(_$_PinModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'options': instance.options,
    };

_$_Options _$$_OptionsFromJson(Map<String, dynamic> json) => _$_Options(
      name: json['name'] as String? ?? "",
      code: json['code'] as String? ?? "",
      info: json['info'] as String? ?? "",
    );

Map<String, dynamic> _$$_OptionsToJson(_$_Options instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'info': instance.info,
    };
