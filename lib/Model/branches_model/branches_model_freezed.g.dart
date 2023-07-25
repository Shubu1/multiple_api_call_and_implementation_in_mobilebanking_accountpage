// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branches_model_freezed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BranchesModel _$$_BranchesModelFromJson(Map<String, dynamic> json) =>
    _$_BranchesModel(
      success: json['success'] as bool? ?? false,
      branches: (json['branches'] as List<dynamic>?)
              ?.map((e) => Branches.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_BranchesModelToJson(_$_BranchesModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'branches': instance.branches,
    };

_$_Branches _$$_BranchesFromJson(Map<String, dynamic> json) => _$_Branches(
      name: json['name'] as String? ?? "",
      code: json['code'] as String? ?? "",
    );

Map<String, dynamic> _$$_BranchesToJson(_$_Branches instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
    };
