import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model_freezed.freezed.dart';
part 'user_model_freezed.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @Default(false) bool success,
    @Default([]) List<Accounts> accounts,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

@freezed
class Accounts with _$Accounts {
  factory Accounts(
      {@Default("") String type,
      @Default("") String number,
      @Default("") String primary}) = _Accounts;

  factory Accounts.fromJson(Map<String, dynamic> json) =>
      _$AccountsFromJson(json);
}
