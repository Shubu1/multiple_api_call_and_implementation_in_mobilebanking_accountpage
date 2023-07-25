import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_api/Model/pin_model/pin_model_freezed.dart';
import 'package:multiple_api/providers/dio_provider.dart';

final pinProvider = FutureProvider.autoDispose<List<Options>>(
  (ref) async {
    return PinProvider(ref).taskList();
  },
);

class PinProvider {
  late Ref ref;
  PinProvider(this.ref);

  Future<List<Options>> taskList() async {
    try {
      final response = await ref
          .read(dioProvider)
          .get('http://10.13.170.32:7082/pin/options');
      if (response.data != null && response.data.isNotEmpty) {
        print(response.data);
        PinModel responseList = PinModel.fromJson(response.data);
        if (responseList.success == true) {
          return responseList.options.toList();
        }
        return [];
      } else {
        return [];
      }
    } on Error catch (error) {
      debugPrint("Error $error");
      rethrow;
    }
  }
}
