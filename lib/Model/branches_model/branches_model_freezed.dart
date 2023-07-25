import 'package:freezed_annotation/freezed_annotation.dart';

part 'branches_model_freezed.freezed.dart';
part 'branches_model_freezed.g.dart';

@freezed
class BranchesModel with _$BranchesModel {
  const factory BranchesModel({
    @Default(false) bool success,
    @Default([]) List<Branches> branches,
  }) = _BranchesModel;

  factory BranchesModel.fromJson(Map<String, dynamic> json) =>
      _$BranchesModelFromJson(json);
}

@freezed
class Branches with _$Branches {
  factory Branches({@Default("") String name, @Default("") String code}) =
      _Branches;

  factory Branches.fromJson(Map<String, dynamic> json) =>
      _$BranchesFromJson(json);
}
