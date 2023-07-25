import 'package:freezed_annotation/freezed_annotation.dart';

part 'pin_model_freezed.freezed.dart';
part 'pin_model_freezed.g.dart';

@freezed
class PinModel with _$PinModel {
  const factory PinModel({
    @Default(false) bool success,
    @Default([]) List<Options> options,
  }) = _PinModel;

  factory PinModel.fromJson(Map<String, dynamic> json) =>
      _$PinModelFromJson(json);
}

@freezed
class Options with _$Options {
  factory Options(
      {@Default("") String name,
      @Default("") String code,
      @Default("") String info}) = _Options;

  factory Options.fromJson(Map<String, dynamic> json) =>
      _$OptionsFromJson(json);
}
